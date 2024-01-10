SELECT DISTINCT
mde.HOUSEHOLD_NAME
, mde.FIRST_NAME
, mde.DO_NOT_EMAIL
, subs.EmailAddress AS EMAIL_ADDRESS
, mde.EMAIL_STATUS
, mde.ACCEPTS_EMAIL
, mde.SFMC_SUB_KEY
, com.SubscriberKey AS SUBSCRIBER_KEY
, mde.LOOKUP_ID
, com.EventDate AS OPT_OUT_DATE
, com.JobID
, com.ListID
, com.Domain
, com.IsUnique
, com.OYBAccountID
FROM _Complaint com
LEFT JOIN 
_Subscribers subs
ON subs.SubscriberKey = com.SubscriberKey
LEFT JOIN
[MASTER DATA EXTENSION] mde
ON mde.EMAIL_ADDRESS = subs.EmailAddress
WHERE com.SubscriberKey is NULL


SELECT DISTINCT
mde.HOUSEHOLD_NAME
, mde.FIRST_NAME
, mde.DO_NOT_EMAIL
, subs.EmailAddress AS EMAIL_ADDRESS
, mde.EMAIL_STATUS
, mde.ACCEPTS_EMAIL
, mde.SFMC_SUB_KEY
, bnc.SubscriberKey AS SUBSCRIBER_KEY
, mde.LOOKUP_ID
, bnc.EventDate AS OPT_OUT_DATE
, bnc.JobID
, bnc.ListID
, bnc.Domain
, bnc.IsUnique
, bnc.OYBAccountID
FROM [DataView_Bounce] bnc
LEFT JOIN 
_Subscribers subs
ON subs.SubscriberKey = bnc.SubscriberKey
LEFT JOIN
[MASTER DATA EXTENSION] mde
ON mde.EMAIL_ADDRESS = subs.EmailAddress
WHERE bnc.SubscriberKey is NULL