{% macro set_default_role() %}

    {% set sql %}
        alter user vijaydbt set default_role='ACCOUNTADMIN';
    {% endset %}

    {{ log('settting default role ', info=True) }}
    {% do run_query(sql) %}
  
{% endmacro %}