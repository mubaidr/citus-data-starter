-- add timestamps (created_at, updated_at) and trigger for updated_at
CREATE OR REPLACE FUNCTION add_custom_timestamps() RETURNS void AS $$
DECLARE
    row_data RECORD;
BEGIN

  FOR row_data IN
      SELECT *
      FROM information_schema.tables
      WHERE table_type = 'BASE TABLE'
        AND table_schema = 'public'
        AND table_name NOT LIKE 'pg\_%'
  LOOP

    -- add timestamps
    EXECUTE ' ALTER TABLE '
    	|| row_data.table_name
    	|| ' ADD COLUMN IF NOT EXISTS '
    	|| ' created_at timestamp with time zone NOT NULL DEFAULT now(), '
    	|| ' ADD COLUMN IF NOT EXISTS '
    	|| ' updated_at timestamp with time zone NOT NULL DEFAULT now(); ';

    -- add trigger for updated_at
		EXECUTE ' CREATE TRIGGER update_moddatetime_' || row_data.table_name
	     	|| ' BEFORE UPDATE ON '
			|| row_data.table_name
			|| ' FOR EACH ROW'
			|| ' EXECUTE PROCEDURE moddatetime(updated_at); ';

    -- add permissions
		EXECUTE ' ALTER TABLE public.'
			|| row_data.table_name
			|| ' OWNER TO postgres; ';

    -- TODO: add limited account permission to tables

  END LOOP;

END; $$ LANGUAGE PLPGSQL;
