"""Linting AI """
from datetime import datetime
import os
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate

import utils

load_dotenv()

def main():
    """Main function that demonstrates OpenAI language model usage when fixing openapi spec file"""

    llm = ChatOpenAI(
    model="gpt-5-mini",
    temperature=0,
    max_tokens=None,
    timeout=None,
    max_retries=0,
    #reasoning_effort=""
    )


    openapi_spec_file = utils.load_json_from_file("./specs/openapi-non-compliant.json")
    spectral_linter_results = utils.load_json_from_file("./specs/spectral-linter-results.json")


    chat_prompt = ChatPromptTemplate.from_messages(
        [
            (
                "system",
                "Please fix the following OpenAPI Specification file based on the provided linting results.",
            ),
            ("user", "{openapi_spec_file}"),
            ("user", "{spectral_linter_results}"),
        ]
    )

    chain = chat_prompt | llm

    start_time = datetime.now()
    print(f"Process started at ==> {utils.current_time()}")

    try:
        results = chain.invoke({
            "openapi_spec_file": openapi_spec_file,
            "spectral_linter_results": spectral_linter_results
        })
        end_time = datetime.now()
        print(f"Process ended at ==> {utils.current_time()}")
        print(f"Total processing time: {utils.time_format(end_time - start_time)}")
        
        total_tokens_utilized = utils.total_tokens_utilized(results)
        print(f"Total tokens utilized: {total_tokens_utilized}")

    except Exception as e:
        print(f"Error occurred: {e}")
        return

    try:
        utils.save_result_to_file("./output/openapi-compliant-results.json",results.content)
    except Exception as e:
        print(f"Error occurred while saving results: {e}")   


if __name__ == "__main__":
    # Entry point of the application.
    
    if not os.environ.get("OPENAI_API_KEY"):
        exit("Please set the OPENAI_API_KEY environment variable")

    if os.environ.get("DEBUG") == "True":
        print("Debug mode is on")
        import debugpy
        debugpy.listen(("0.0.0.0", 5678))
        print("Waiting for debugger attach...")
        debugpy.wait_for_client()
    main()