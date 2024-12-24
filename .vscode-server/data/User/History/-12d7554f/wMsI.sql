with 
asd as
(
select * from {{ source('g_ads','user_location_view')}}
)