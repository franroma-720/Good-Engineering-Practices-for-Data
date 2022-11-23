# Testing

## Background

Writing tests for our own code is good practice. Good tests can:

1. Verify the code is working correctly, especially for edge cases
2. Prevent future regressions (something that used to work doesn’t anymore)
3. Document the code’s behavior
4. Provide design guidance by balancing how to design code specifically vs. generally
5. Support refactoring

There are a number of different types of testing we can apply to our code but we will focus on **data testing** and **unit testing**, two types of testing that aim to be quick and simple while providing a high degree of code coverage.

| | Data Testing | Unit Testing |
| --- | --- | --- |
| *What is it?* | Testing quality of data | Testing functionality of code |
| *When does the test run?* | Code execution | Manually during development and automatically during branch merge |

### Test-Driven Development: Yay or Nay?

There is a programming style called “test-driven development” where programmers write tests, in particular unit tests, before they write code. This programming style is controversial because writing tests first focuses attention on getting specific features working rather than finding the best design.

However, ***test-driven development is a great idea when fixing bugs***. Before fixing a bug, write a unit test that fails because of the bug. Then fix the bug and make sure the unit test now passes.

## Data Testing

Data Testing, also known as Data Validation, is testing to ensure we are passing quality data through our products.Typical data testing includes testing:

- Schema requirements are met for dataframes
- Expected data types for dataframes
- Values in the data against a set of rules

As mentioned above, data testing should occur at code execution. This means there should be a consequence for what should happen if data validation fails. This consequence will be dependent on the type of data validation testing running and the business requirements of the application.

For example, for some reports, it may be acceptable if the data is a few days stale. In this case, we may want a warning message displayed, but we do not need the product to prevent any data from displaying. However, for other products, we may have much stricter requirements on the timeliness and quality of the data displaying in our products and need to prevent data from surfacing if it does not meet quality expectations.

### R Tutorial

A great package for performing data testing in R is the [validate package](https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html). Install this package and open the `RDataTestingExamples.Rmd` document in the RStudio IDE and knit to see examples of some common ways of using the `validate` package.


### Python Tutorial

A great package for performing data testing in Python is the [pandera package](https://pandera.readthedocs.io/en/stable/). Install this package and open the `PythonDataTestingExamples.ipynb` document in the VSCode IDE and "Run All" to see examples of some common ways of using the `pandera` package.


## Unit Testing

Unit testing is a software testing method where individual units of source code, like a function definition or other module, are tested to determine if they are fit for use. Unit tests should be run frequently when making code changes, including before any commit to a branch and before any merge request. *Merge requests should absolutely not be submitted until **all** unit tests are succeeding*.

Unit tests can be applied in a number of different ways. A major way that they can be helpful that is relevant to the work we do at Acuitas is by:

- Writing all data frame transformations more advanced than column selection, row and column ordering, and column renaming as functions and then writing unit tests that test the edge cases of that data transformation function. For example, what happens if you pass the data transformation function an empty dataframe or a dataframe where one or more columns contains null values? Robust functions should be able to handle these edge cases and unit testing can help check for that.
- Writing unit tests prior to resolving bugs to ensure the bug has been properly resolved AND to prevent any future regression.

### Code Coverage

In more traditional software engineering settings, you may hear about “code coverage” of unit tests. Code coverage is a metric or series of metrics that can help you understand how much of your code is tested and is often used as an indicator of code quality. There are many different ways of measuring code coverage, including how many defined functions are called and most commonly, how many lines of code are covered by unit tests.

Setting useful targets for how high you want your code coverage metrics to be is not easy or broadly applicable across products. It is unique to each code base and high percentages don’t necessarily indicate that the tests written are robust.

We will not be worrying about code coverage at Acuitas for the time being, but if you are interested in learning more, see the [covr](https://covr.r-lib.org/) package in R and the [Coverage](https://coverage.readthedocs.io/en/6.5.0/) and [pytest-cov](https://pytest-cov.readthedocs.io/en/latest/) packages in python.


### R Tutorial

A great package for unit testing in R is the [testthat package](https://testthat.r-lib.org/). Install this package and follow the instructions in the `RUnitTestingExamples\README.md` file for examples of common ways of using the `testthat` package.

### Python Tutorial

A great package for unit testing in Python is the [pytest package](https://docs.pytest.org/en/7.1.x/). The [NumPy](https://numpy.org/doc/stable/reference/routines.testing.html) and [pandas](https://pandas.pydata.org/pandas-docs/version/0.22.0/api.html#testing-functions) packages also come with built in unit testing functionality that can be leveraged by pytest. Install this package and follow the instructions in the `PythonUnitTestingExamples\README.md` file for examples of common ways of using the `pytest` package.


## Resources

- [Five Factor Testing](https://madeintandem.com/blog/five-factor-testing/) by Sarah Mei
- R Examples:
    - [Unit Testing in R](https://towardsdatascience.com/unit-testing-in-r-68ab9cc8d211?gi=7a75235c7390) by André Müller on Towards Data Science
- Python Examples:
    - [Ways I Use Testing as a Data Scientist](https://www.peterbaumgartner.com/blog/testing-for-data-science/) by Peter Baumgartner
    - [Unit Testing for Data Scientists](https://towardsdatascience.com/unit-testing-for-data-scientists-dc5e0cd397fb) by Maarten Grootendorst on Towards Data Science
