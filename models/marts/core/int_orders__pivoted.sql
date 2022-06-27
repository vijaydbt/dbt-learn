{%- set payment_methods = get_payment_methods() -%}

with payments as (
   select * from  {{ ref('stg_payments') }}
),
 
final as (
   select
       order_id,
       {% for pmt_method in payment_methods -%}
         sum(case when payment_method = '{{pmt_method}}' then amount else 0 end) as {{pmt_method}}_amount
        {%- if not loop.last -%}
         ,
        {% endif -%}
       {%- endfor %}
 
   from payments
   group by 1
)
 
select * from final