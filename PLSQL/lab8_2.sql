set serveroutput on
CREATE TABLE supplier
( supplier_id numeric(10) not null,
  supplier_name varchar2(50) not null,
  contact_name varchar2(50),
  CONSTRAINT supplier_pk PRIMARY KEY (supplier_id)
);

CREATE TABLE products
( product_id numeric(10) not null,
  supplier_id numeric(10) not null,
  CONSTRAINT fk_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES supplier (supplier_id)
);

INSERT INTO supplier
(supplier_id, supplier_name, contact_name)
VALUES (1000, 'Microsoft', 'Bill Gates');

INSERT INTO products
(product_id, supplier_id)
VALUES (50000, 1000);

select*from supplier;
select*from products;

DELETE from supplier
WHERE supplier_id = 1000;

DECLARE

BEGIN
DELETE from supplier
WHERE supplier_id = 1000;
EXCEPTION
   WHEN OTHERS
   THEN
   DECLARE
      e_childrecord_exists NUMBER := SQLCODE;
   BEGIN
        IF e_childrecord_exists = -2292
        THEN
          DBMS_OUTPUT.PUT_LINE('Cannot delete');
        END IF;
    END;
END;

DECLARE
      e_childrecord_exists NUMBER;
   BEGIN
DELETE from supplier
WHERE supplier_id = 1000;
EXCEPTION
   WHEN OTHERS
    THEN
    e_childrecord_exists:=SQLCODE;
        IF e_childrecord_exists = -2292
        THEN
          DBMS_OUTPUT.PUT_LINE('Cannot delete (child ercords exist.)');
        END IF;
END;

select*from departments;
DECLARE
      e_childrecord_exists NUMBER;
   BEGIN
DELETE from departments
WHERE department_id = 40;
EXCEPTION
   WHEN OTHERS
    THEN
    e_childrecord_exists:=SQLCODE;
        IF e_childrecord_exists = -2292
        THEN
          DBMS_OUTPUT.PUT_LINE('Cannot delete (child ercords exist.)');
        END IF;
END;