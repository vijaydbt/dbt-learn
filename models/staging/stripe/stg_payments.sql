select
    orderid,
    paymentmethod,
    sum(amount)
from
    raw.stripe.payment
where
    status = 'success'
group by
    orderid,
    paymentmethod
order by
    3 desc