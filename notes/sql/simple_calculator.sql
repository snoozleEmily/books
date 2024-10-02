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
  DBMS_OUTPUT.PUT_LINE('ADDITION: ' || result); 

  -- Subtraction
  result := first_number - second_number;
  DBMS_OUTPUT.PUT_LINE('SUBTRACTION: ' || result);

  -- Multiplication
  result := first_number * second_number;
  DBMS_OUTPUT.PUT_LINE('MULTIPLICATION: ' || result);
  
  -- Division
  result := ROUND(first_number / second_number, 2);
  DBMS_OUTPUT.PUT_LINE('DIVISION: ' || result);
  
  -- Remainder Of Division
  result := MOD(first_number, second_number);
  DBMS_OUTPUT.PUT_LINE('MODULUS: ' || result);
  
  -- Exponentiation
  result := power(first_number, second_number);
  DBMS_OUTPUT.PUT_LINE('POWER: ' || result);
  
  -- Rule of three 
  result := ROUND((first_number + second_number + third_number) / 3, 2);
  DBMS_OUTPUT.PUT_LINE('RULE OF THREE: ' || result);

END;
/