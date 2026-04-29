-- Active: 1770811575495@@127.0.0.1@3306@mydb

INSERT INTO `mydb`.`clients` (`firstname`, `lastname`, `birthdate`, `street`, `housenum`, `posta`, `city`, `username`, `password`, `email`, `phone`) VALUES
('John',    'Smith',    '1990-05-14', 'Maple Street',    '12A',  '10001', 'New York',    'jsmith90',   'f43e0f7145557b5b14d7fd7a98ec5de0', 'john.smith@email.com',    '+420-212-555-010'),
('Emma',    'Johnson',  '1985-11-23', 'Oak Avenue',      '7',    '90001', 'Los Angeles', 'ejohnson85', '871b0abaaa255a35e488964d8acf3924', 'emma.johnson@email.com',  '+420-310-555-020'),
('Michael', 'Williams', '1995-03-08', 'Pine Road',       '33B',  '60601', 'Chicago',     'mwilliams95','1858ffce18c3010b92ecd2f9d3c24b43', 'michael.w@email.com',     '+420-312-555-030'),
('Sarah',   'Brown',    '1988-07-30', 'Cedar Boulevard', '101',  '77001', 'Houston',     'sbrown88',   'f549fc7492db743cca8f9ad216e2b30c', 'sarah.brown@email.com',   '+420-713-555-040');

INSERT INTO `mydb`.`certificate` (`certifkey`, `clients_id`) VALUES
('CERT-0A1B2C3D4E5F', 1),
('CERT-1F2E3D4C5B6A', 2),
('CERT-2A3B4C5D6E7F', 3),
('CERT-3F4E5D6C7B8A', 4);