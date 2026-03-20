-- 1. Create a staging table with the four different UUID string formats
CREATE TABLE qz_uuid_strings (
  color_name VARCHAR2(20),
  uuid_str   VARCHAR2(100)
);


INSERT INTO qz_uuid_strings VALUES ('Red',    'ee41377e3c664caba19e93e9f70c51ca');      -- 32 hex
INSERT INTO qz_uuid_strings VALUES ('Green',  '{dfb05bd59bd142dcb92a0cd4cf4d0a2a}');    -- Braces
INSERT INTO qz_uuid_strings VALUES ('Blue',   'ef0208ba-c4fb-4e63-8d4f-67734a442d56');  -- Hyphens
INSERT INTO qz_uuid_strings VALUES ('Yellow', '{2dc718cb-1d4f-48fd-a164-54942d9f50d1}');-- Hyphens + Braces
COMMIT;

delete from QZ_UUID_STRINGS where color_name = 'Yellow';

-- 2. Create the target table using the RAW(16) type
CREATE TABLE qz_colors (
  color_name VARCHAR2(20),
  color_id   RAW(16)
);

-- 3. Run the solution using uuid_to_raw
INSERT INTO qz_colors (color_name, color_id)
SELECT color_name, uuid_to_raw(uuid_str)
FROM qz_uuid_strings;

-- 4. Verify the results
-- Use RAW_TO_UUID to see them back in a standard hyphenated format
SELECT 
    color_name, 
    color_id as raw_hex_value,
    raw_to_uuid(color_id) as formatted_uuid
FROM qz_colors;

-- Cleanup (Optional)
-- DROP TABLE qz_uuid_strings;
-- DROP TABLE qz_colors;