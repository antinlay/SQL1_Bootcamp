SELECT person.name age
	FROM person
	WHERE address = 'Kazan' AND gender = 'female'
	ORDER BY person.name;