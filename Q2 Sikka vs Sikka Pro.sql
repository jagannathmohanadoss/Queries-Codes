

create database jagan;

use jagan;



select a.*,b.app_id from [jagan].[dbo].[Q2_User offer data] a
left join [jagan].[dbo].[Q2_users signup] b on a.user_id=b.user_id
group by app_id;


-- Based on initiatiion
select b.app_id, 
count(distinct a.user_id) as unique_users,
count(*) as total_initiations, count(case when status='ONGOING' then 1 end) as ongoing,
 count(case when status='COMPLETED' then 1 end) as completed
from [jagan].[dbo].[Q2_User offer data] a
left join [jagan].[dbo].[Q2_users signup] b on a.user_id=b.user_id
group by app_id;

--Based on completeion

select app_id,sum(total_payout_in_paise)/100 as total_payout,sum(total_revenue_in_paise)/100 as total_revenue,count(user_id) as reccurringusercount,
count(distinct user_id) as uniqueusercount
FROM [jagan].[dbo].[Q2_User_offer_completion_data] a
left join [jagan].[dbo].[Q2_rewards details] b on a.reward_id=b.reward_id
group by app_id;



select * from [jagan].[dbo].[Q2_User offer data] a
count(distinct case when completed_at is not null then completed end) over (partition by item) as num_promo_1












select * from 
[jagan].[dbo].[Q2_users signup]