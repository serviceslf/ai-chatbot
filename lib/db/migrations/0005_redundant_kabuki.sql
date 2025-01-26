CREATE TABLE IF NOT EXISTS "Role" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	CONSTRAINT "Role_name_unique" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "RoleTool" (
	"roleid" uuid NOT NULL,
	"toolid" uuid NOT NULL,
	CONSTRAINT "RoleTool_roleid_toolid_pk" PRIMARY KEY("roleid","toolid")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "Tool" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"description" text,
	CONSTRAINT "Tool_name_unique" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "UserRole" (
	"userid" uuid NOT NULL,
	"roleid" uuid NOT NULL,
	CONSTRAINT "UserRole_userid_roleid_pk" PRIMARY KEY("userid","roleid")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "RoleTool" ADD CONSTRAINT "RoleTool_roleid_Role_id_fk" FOREIGN KEY ("roleid") REFERENCES "public"."Role"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "RoleTool" ADD CONSTRAINT "RoleTool_toolid_Tool_id_fk" FOREIGN KEY ("toolid") REFERENCES "public"."Tool"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "UserRole" ADD CONSTRAINT "UserRole_userid_User_id_fk" FOREIGN KEY ("userid") REFERENCES "public"."User"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "UserRole" ADD CONSTRAINT "UserRole_roleid_Role_id_fk" FOREIGN KEY ("roleid") REFERENCES "public"."Role"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
