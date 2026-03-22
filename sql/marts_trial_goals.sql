
SELECT 
    organization_id,
    COUNT(CASE WHEN activity_name = 'Scheduling.Shift.Created' THEN 1 END) >= 5 AS goal_shift_created_5,
    COUNT(CASE WHEN activity_name = 'Mobile.Schedule.Loaded' THEN 1 END) >= 1 AS goal_mobile_loaded,
    COUNT(CASE WHEN activity_name = 'PunchClock.PunchedIn' THEN 1 END) >= 1 AS goal_punch_in,
    COUNT(CASE WHEN activity_name = 'Scheduling.Shift.Approved' THEN 1 END) >= 1 AS goal_shift_approved,
    COUNT(CASE WHEN activity_name = 'Communication.Message.Created' THEN 1 END) >= 1 AS goal_communication,
    (COUNT(CASE WHEN activity_name = 'Scheduling.Shift.Created' THEN 1 END) >= 5 AND
     COUNT(CASE WHEN activity_name = 'Mobile.Schedule.Loaded' THEN 1 END) >= 1 AND
     COUNT(CASE WHEN activity_name = 'PunchClock.PunchedIn' THEN 1 END) >= 1 AND
     COUNT(CASE WHEN activity_name = 'Scheduling.Shift.Approved' THEN 1 END) >= 1 AND
     COUNT(CASE WHEN activity_name = 'Communication.Message.Created' THEN 1 END) >= 1) AS trial_activated
FROM staging_cleaned_events
GROUP BY organization_id;
