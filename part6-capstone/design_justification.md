# Part 6 — Capstone Architecture Design

## Storage Systems

The hospital architecture uses four storage systems, each chosen for a specific goal.

**MySQL** is used for storing core patient records, admissions, treatments, and billing data. Since this data is highly structured and requires strict consistency — for example, a patient's medication or surgery record must never be partially written — MySQL's ACID-compliant transactional model is the right fit. Any corruption here could directly harm patients, so reliability is non-negotiable.

**MongoDB** is used to store doctor query history and flexible patient notes. Doctors may add free-text observations, diagnostic attachments, or semi-structured clinical notes that do not fit neatly into a fixed schema. MongoDB's document model handles this variability naturally, and it serves as the backend for the NLP query engine, storing query logs and retrieved context.

**InfluxDB with Kafka** handles real-time ICU vitals streaming. InfluxDB is purpose-built for time-series data — heart rate, blood pressure, oxygen saturation — where every reading is timestamped and queries are always time-ranged. Kafka acts as the message broker, ingesting high-frequency sensor data and routing it to both InfluxDB for storage and the real-time dashboard for alerting.

**A cloud Data Warehouse (Snowflake or BigQuery)** powers monthly management reporting. It stores historical, aggregated data — bed occupancy rates, department-wise costs, readmission trends — optimised for analytical queries across large datasets.

## OLTP vs OLAP Boundary

The OLTP boundary covers all day-to-day hospital operations: patient admissions, doctor queries, ICU monitoring, and billing transactions. MySQL and MongoDB sit firmly in this layer, handling frequent small reads and writes with low latency.

The OLAP boundary begins at the Data Warehouse. A nightly ETL pipeline extracts structured data from MySQL, transforms it into an analytical schema (star schema with fact and dimension tables), and loads it into the warehouse. This separation ensures that heavy analytical queries — like computing monthly bed occupancy across all departments — do not slow down the operational systems that doctors and nurses depend on in real time.

## Trade-offs

The most significant trade-off in this design is **system complexity**. Running four different storage systems (MySQL, MongoDB, InfluxDB, Snowflake) increases operational overhead — each system requires separate maintenance, monitoring, backup strategies, and team expertise.

To mitigate this, the hospital could adopt a **Data Lakehouse layer** (such as Delta Lake on top of cloud object storage) as a unified intermediate store. Raw data from all sources lands in the lakehouse first, and purpose-specific systems query it as needed. This reduces data duplication and simplifies the pipeline. Additionally, using a managed cloud provider (AWS, GCP, or Azure) for all components reduces infrastructure management burden significantly, allowing the team to focus on data quality and model performance rather than server maintenance.
