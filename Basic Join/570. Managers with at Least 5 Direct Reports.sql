SELECT t2.name
FROM Employee t1
JOIN Employee t2 ON t1.managerId = t2.id
GROUP BY t2.id, t2.name
HAVING COUNT(t1.managerId) >= 5;
