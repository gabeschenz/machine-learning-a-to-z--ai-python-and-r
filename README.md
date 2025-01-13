This is a repository for the Machine Learning A-Z course on Udemy. It contains the configuration so that you can run all assignments and examples from the course, as long as you have Docker and VS Code installed (with the devcontainer extension).

1. Install Docker: https://docs.docker.com/get-docker/
    - Give docker a lot of resources, as the ipykernel will crash otherwise.

2. Install VS Code: https://code.visualstudio.com/download
3. Install the Devcontainer Extension for VS Code: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
4. Clone this repository to your local machine: `git clone git@github.com:gabeschenz/machine-learning-a-to-z--ai-python-and-r.git`

Let's clean up these file and folder names - we're not a bunch of Windows heathens after all.
(I'm sure there is a more elegant way to do it, and maybe I'll spend some more time figuring it out later.)

Note that there is no real requirement to rename all of the directories - this is merely my own way of organizing the files and folders.



```bash
setopt NULL_GLOB;
unzip 'Machine Learning A-Z (Codes and Datasets)-20250111T180757Z-001.zip'
mv 'Machine Learning A-Z (Codes and Datasets)' machine-learning-az-codes-and-datasets

cd machine-learning-az-codes-and-datasets

for directory in  ./*; do
    new_directory_name="$(echo -n "${directory}" | sed -E 's/Part ([0-9 ]) /Part 0\1/g' | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -s '-')"
    new_directory_name="${new_directory_name%-*}"
    mv "${directory}"  "${new_directory_name}"

    (cd "${new_directory_name}"
    for subdirectory in ./*; do
        new_subdirectory_name="$(echo -n "${subdirectory}" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -s '-')"
        new_subdirectory_name="${new_subdirectory_name%-*}"
        mv "${subdirectory}"  "${new_subdirectory_name}"

        (cd "${new_subdirectory_name}"; \
        for subsubdirectory in ./*; do
            new_subsubdirectory_name="$(echo -n "$subsubdirectory" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -s '-')"
            new_subsubdirectory_name="${new_subsubdirectory_name%-*}"
            mv "${subsubdirectory}"  "${new_subsubdirectory_name}"
        done)
    done)
done
```

## Working with the code

As a quick check to make sure that all the packages are installed correctly, you can create a new notebook and run the following code:

```python
import matplotlib as mp
import numpy as np
import pandas as pd
import sklearn as sk 
import tensorflow as tf 
import xgboost as xgb

print(f"matplotlib version: {mp.__version__}")
print(f"numpy version: {np.__version__}")
print(f"pandas version: {pd.__version__}")
print(f"sklearn version: {sk.__version__}")
print(f"tensorflow version: {tf.__version__}")
print(f"xgboost version: {xgb.__version__}")
```

At this moment, I get the following output:
```
matplotlib version: 3.10.0
numpy version: 1.26.4
pandas version: 2.2.3
sklearn version: 1.6.1
tensorflow version: 2.18.0
xgboost version: 2.1.3
```

This confirms that all the packages are installed correctly and that you can start working with the code. You can now proceed to the next steps in the project. 

