CREATE OR REPLACE FUNCTION power(base NUMBER, exponent NUMBER) RETURN NUMBER IS
  result INTEGER := 1;
BEGIN
    FOR i IN 1..exponent LOOP
        result := result * base; -- Multiply the base by itself
    END LOOP;
END;
/

CREATE OR REPLACE FUNCTION is_prime_check(p_number IN INTEGER) RETURN BOOLEAN IS
    i INTEGER;
BEGIN
    IF p_number < 2 THEN
        RETURN FALSE;
    END IF;
    FOR i IN 2..FLOOR(SQRT(p_number)) LOOP
        IF p_number MOD i = 0 THEN
            RETURN FALSE;
        END IF;
    END LOOP;
    RETURN TRUE;
END;
/



DECLARE
  first_number NUMBER := 10;
  second_number NUMBER := 3;
  third_number NUMBER := 25;
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

  -- Rule of three 
  result := ROUND((first_number + second_number + third_number) / 3, 2);
  dbms_output.put_line('Rule Of Three: ' || result);
  
  -- Exponentiation
  result := power(first_number, second_number);
  dbms_output.put_line('Power: ' || result);
END;


/