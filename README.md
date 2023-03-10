# Snowflake Data Test - Starter Project

### Prerequisites

#### Python 3.8.* or later.

See installation instructions at: https://www.python.org/downloads/

Check you have python3 installed:

```bash
python3 --version
```

### Dependencies and data

#### Creating a virtual environment

Ensure your pip (package manager) is up to date:

```bash
pip3 install --upgrade pip
```

To check your pip version run:

```bash
pip3 --version
```

Create the virtual environment in the root of the cloned project:

```bash
python3 -m venv .venv
```

#### Activating the newly created virtual environment

You always want your virtual environment to be active when working on this project.

```bash
source ./.venv/bin/activate
```

#### Installing Python requirements

This will install some of the packages you might find useful:

```bash
pip3 install -r ./requirements.txt
```


#### Generating the data

A data generator is included as part of the project in `./input_data_generator/main_data_generator.py`
This allows you to generate a configurable number of months of data.
Although the technical test specification mentions 6 months of data, it's best to generate
less than that initially to help improve the debugging process.

To run the data generator use:

```bash
python ./input_data_generator/main_data_generator.py
```

This should produce customers, products and transaction data under `./input_data/starter`



#### Getting started

Please save Snowflake model code in `snowflake` and infrastructure code in `infra` folder.

Update this README as code evolves.


Comments:
1. Database and schema could be parametrized, at least for {env} for easier migration between environments;
2. Auto ingestion with stream consumption is created only for fact table. It should be done for dimensions also for full CDC and SCD;
3. There are only tables in raw schema for dimensions. After implementing proper loading of dim_products and dim_customers these tables should be used from core schema;
4. There is a dirty view on fact and dimensions. It should be prematerialized and then, using CLONE or SWAP functionality, provided to consumption by downstreams without downtime or compute needed or downstream side;
5. Tests are on views, common approach with the team should be discussed and some tools used to not maintain execution manually;
6. No Flyway nor Liquibase configuration. For bigger implementations that would be worth to configure;
7. No CI/CD nor any gitflow. It works perfectly with point 6. GitHub also helps with secrets (username and password) for connection to Snowflake;
8. Have a good day :) 