SET 'auto.offset.reset' = 'earliest';
CREATE STREAM productattr_stream (
    PARTNUMBER VARCHAR,
    attr_name VARCHAR,
    attr_value VARCHAR,
    LASTUPDATE VARCHAR
) WITH (
    KAFKA_TOPIC = 'db2.product.attributes',
    VALUE_FORMAT = 'JSON'
);
CREATE TABLE productattr_map WITH (
    KAFKA_TOPIC = 'db2.product.attributemap',
    VALUE_FORMAT = 'JSON'
) AS
select PARTNUMBER AS ID,
    AS_VALUE(PARTNUMBER) as PARTNUMBER,
    TRANSFORM(
        COLLECT_SET(
            CAST(
                AS_MAP(
                    ARRAY [
                        'name', 'value'
                    ],
                    ARRAY [
                        CAST (attr_name AS STRING), CAST (attr_value AS STRING)
                    ]
                ) AS STRING
            )
        ),
        P => SPLIT_TO_MAP(REPLACE(REPLACE(P, '{', ''), '}', ''), ',', '=')
    ) AS attributes
from PRODUCTATTR_STREAM
group by partnumber emit changes;
-----
-- CREATE stream catentryattrs (
--     PARTNUMBER VARCHAR KEY,
--     attributes ARRAY < STRUCT < name VARCHAR,
--     value VARCHAR >>
-- ) WITH (
--     KAFKA_TOPIC = 'db2.catentry.attributes',
--     VALUE_FORMAT = 'JSON',
--   	PARTITIONS = 1
-- );
-- INSERT INTO catentryattrs
-- select PARTNUMBER,
--     TRANSFORM(
--         COLLECT_SET(
--             CAST(
--                 AS_MAP(
--                     ARRAY [
--                         'name',
--                         'value'
--         ],
--                     ARRAY [
--                         CAST (attr_id AS STRING),
--                         CAST (attr_value AS STRING)
--         ]
--                 ) AS STRING
--             )
--         ),
--         P => SPLIT_TO_MAP(REPLACE(REPLACE(P, '{', ''), '}', ''), ',', '=')
--     ) AS attributes
-- from PRODUCTATTR_STREAM
-- group by partnumber emit changes;