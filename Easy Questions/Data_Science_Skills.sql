SELECT candidate_id 
FROM candidates
WHERE skill in ('Python', 'Tableau', 'PostgreSQL')
group by candidate_id
having count(skill) = 3