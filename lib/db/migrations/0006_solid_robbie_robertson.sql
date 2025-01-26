CREATE TABLE IF NOT EXISTS "ToolGroup" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	CONSTRAINT "ToolGroup_name_unique" UNIQUE("name")
);
--> statement-breakpoint
ALTER TABLE "Tool" ADD COLUMN "groupid" uuid;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "Tool" ADD CONSTRAINT "Tool_groupid_ToolGroup_id_fk" FOREIGN KEY ("groupid") REFERENCES "public"."ToolGroup"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
