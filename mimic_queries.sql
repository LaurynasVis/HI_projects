WITH unable_pain_stays AS (
    SELECT DISTINCT stay_id
    FROM triage
    WHERE LOWER(TRIM(pain)) = 'unable'

    UNION

    SELECT DISTINCT stay_id
    FROM vitalsign
    WHERE LOWER(TRIM(pain)) = 'unable'
)

SELECT DISTINCT
    d.icd_code,
    d.icd_version,
    d.icd_title,
    e.gender,
    e.race
FROM unable_pain_stays u
JOIN diagnosis d
    ON u.stay_id = d.stay_id
JOIN edstays e
    ON u.stay_id = e.stay_id
ORDER BY d.icd_title ASC;