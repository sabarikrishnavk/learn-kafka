SET 'auto.offset.reset' = 'earliest';
CREATE STREAM storeattr_stream (
    IDENTIFIER VARCHAR,
    name VARCHAR,
    value VARCHAR 
) WITH (
    KAFKA_TOPIC = 'db2.store.attributes',
    VALUE_FORMAT = 'JSON'
);
CREATE TABLE storeattr_map WITH (
    KAFKA_TOPIC = 'db2.store.attributemap',
    VALUE_FORMAT = 'JSON'
) AS
select IDENTIFIER AS ID,
    AS_VALUE(IDENTIFIER) as IDENTIFIER,
    TRANSFORM(
        COLLECT_SET(
            CAST(
                AS_MAP(
                    ARRAY [
                        'key',
                        'value'
                      
        ],
                    ARRAY [
                        CAST (name AS STRING),
                        CAST (value AS STRING)
                     
        ]
                ) AS STRING
            )
        ),
        P => SPLIT_TO_MAP(REPLACE(REPLACE(P, '{', ''), '}', ''), ',', '=')
    ) AS attributes
from storeattr_stream
group by IDENTIFIER emit changes; 