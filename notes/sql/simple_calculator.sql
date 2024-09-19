-- PLSQL
DECLARE
  first_number NUMBER := 10;
  second_number NUMBER := 3;
  result NUMBER;
BEGIN 
  -- Addition
  result := first_number + second_number;
  dbms_output.put_line('Addition: ' || result); 

  -- Subtraction
  result := first_number - second_number;
  dbms_output.put_line('Subtraction: ' || result);

  -- Multiplication
  result := first_number * second_number;
  dbms_output.put_line('Multiplication: ' || result);
  
  -- Division
  result := ROUND(first_number / second_number, 2);
  dbms_output.put_line('Division: '|| result);
END;
/