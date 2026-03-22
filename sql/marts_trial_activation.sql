SELECT *, 
    (goal_shift_created_5 AND goal_mobile_loaded AND goal_punch_in 
     AND goal_shift_approved AND goal_communication) AS trial_activated 
FROM marts.trial_goals;