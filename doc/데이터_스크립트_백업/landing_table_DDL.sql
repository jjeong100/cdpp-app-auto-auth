-- landing."CX_AP_ESCL_LOG" definition

-- Drop table

-- DROP TABLE landing."CX_AP_ESCL_LOG";

CREATE TABLE landing."CX_AP_ESCL_LOG" (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT now(),
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT now(),
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	sla_expiration numeric(22, 7) NULL,
	db_last_upd_src varchar(50) NULL,
	email_action_id varchar(15) NULL,
	email_addr varchar(2000) NULL,
	log_detail varchar(2000) NULL,
	sr_id varchar(15) NULL,
	consecutive_hours varchar(1) NULL,
	dlr_based_sla varchar(1) NULL,
	sla_expired_flg varchar(1) NULL,
	CONSTRAINT cx_ap_escl_log_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX cx_ap_escl_log_conflict_id_idx ON landing."CX_AP_ESCL_LOG" USING btree (conflict_id, par_row_id, name, type);
CREATE INDEX cx_ap_escl_log_par_row_id_idx ON landing."CX_AP_ESCL_LOG" USING btree (par_row_id, sla_expired_flg, sla_expiration);
CREATE INDEX cx_ap_escl_log_type_idx ON landing."CX_AP_ESCL_LOG" USING btree (type, name);


-- landing."S_PARTY_PER" definition

-- Drop table

-- DROP TABLE landing."S_PARTY_PER";

CREATE TABLE landing."S_PARTY_PER" (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT now(),
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT now(),
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	direct_rel_flg varchar(1) NOT NULL DEFAULT 'N'::character varying,
	party_id varchar(15) NOT NULL,
	person_id varchar(15) NOT NULL,
	reference_flg varchar(1) NOT NULL DEFAULT 'N'::character varying,
	start_dt timestamp NOT NULL,
	admit_flg varchar(1) NULL,
	board_seat_flg varchar(1) NULL,
	db_last_upd timestamp NULL,
	end_dt timestamp NULL,
	"COMMENTS" varchar(255) NULL,
	db_last_upd_src varchar(50) NULL,
	pr_relation_id varchar(15) NULL,
	reference_type_cd varchar(30) NULL,
	rel_sub_type_cd varchar(30) NULL,
	rel_type_cd varchar(30) NULL,
	responsibility varchar(250) NULL,
	title varchar(100) NULL,
	x_department varchar(100) NULL,
	x_notes varchar(200) NULL,
	x_status varchar(30) NULL,
	CONSTRAINT s_party_per_pk PRIMARY KEY (row_id)
);
CREATE INDEX s_party_per_party_id_idx ON landing."S_PARTY_PER" USING btree (party_id);
CREATE UNIQUE INDEX s_party_per_person_id_idx ON landing."S_PARTY_PER" USING btree (person_id, party_id, conflict_id);
CREATE INDEX s_party_per_person_id_idx2 ON landing."S_PARTY_PER" USING btree (person_id, party_id);


-- landing."Z_DR_ATT_DATA" definition

-- Drop table

-- DROP TABLE landing."Z_DR_ATT_DATA";

CREATE TABLE landing."Z_DR_ATT_DATA" (
	dr_row_id numeric(15) NOT NULL,
	created timestamp NULL DEFAULT now(),
	created_by varchar(500) NULL,
	last_up timestamp NULL DEFAULT now(),
	last_upd_by varchar(500) NULL,
	par_row_id varchar(15) NOT NULL,
	file_name varchar(200) NULL,
	file_data bytea NULL,
	"COMMENTS" varchar(1000) NULL,
	"VALID" varchar(1) NULL,
	ws_row_id varchar(15) NULL,
	CONSTRAINT z_dr_att_data_pk PRIMARY KEY (dr_row_id)
);


-- landing.aprovou_levou definition

-- Drop table

-- DROP TABLE landing.aprovou_levou;

CREATE TABLE landing.aprovou_levou (
	row_id varchar(30) NULL DEFAULT nextval('process.seq_massive_public'::regclass)::text,
	par_row_id varchar(30) NULL,
	cpf_cnpj varchar(30) NULL,
	dealer varchar(30) NULL,
	dealer_cnpj varchar(30) NULL,
	first_name varchar(30) NULL,
	full_name varchar(30) NULL,
	email varchar(295) NULL,
	telefone varchar(30) NULL,
	data_validade varchar(30) NULL,
	modelo varchar(295) NULL,
	parcela varchar(30) NULL,
	dealer_code varchar(30) NULL,
	id_siebel varchar(30) NULL
);


-- landing.cx_amaro definition

-- Drop table

-- DROP TABLE landing.cx_amaro;

CREATE TABLE landing.cx_amaro (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	db_last_upd timestamp NULL,
	rating_all numeric(10, 2) NULL,
	rating_attendant numeric(10, 2) NULL,
	rating_mechanic numeric(10, 2) NULL,
	research_date timestamp NULL,
	sna_cod numeric(10, 2) NULL,
	sna_date timestamp NULL,
	account_id varchar(15) NULL,
	asset_id varchar(15) NULL,
	contact_id varchar(15) NULL,
	db_last_upd_src varchar(50) NULL,
	dealer_id varchar(15) NULL,
	integration_id varchar(100) NULL,
	research_name varchar(100) NULL,
	sna_comment varchar(255) NULL,
	sna_type varchar(100) NULL,
	"source" varchar(30) NULL,
	status varchar(100) NULL,
	sub_status varchar(100) NULL,
	sra_sr_id varchar(15) NULL
);
CREATE INDEX cx_amaro_integration_id_idx ON landing.cx_amaro USING btree (integration_id);
CREATE INDEX cx_amaro_research_date_idx ON landing.cx_amaro USING btree (research_date);


-- landing.cx_amaro_answer definition

-- Drop table

-- DROP TABLE landing.cx_amaro_answer;

CREATE TABLE landing.cx_amaro_answer (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(22, 1) NULL DEFAULT 0,
	conflict_id varchar(15) NULL DEFAULT '0'::character varying,
	answer_value numeric(22, 1) NULL,
	db_last_upd timestamp NULL,
	answer_compl varchar(255) NULL,
	db_last_upd_src varchar(50) NULL,
	integration_id varchar(30) NULL,
	question_comments varchar(2000) NULL,
	question_id varchar(30) NULL,
	question_code numeric(22, 1) NULL,
	answer_long text NULL
);


-- landing.cx_ap_escl_log definition

-- Drop table

-- DROP TABLE landing.cx_ap_escl_log;

CREATE TABLE landing.cx_ap_escl_log (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	sla_expiration numeric(22, 7) NULL,
	db_last_upd_src varchar(50) NULL,
	email_action_id varchar(15) NULL,
	email_addr varchar(2000) NULL,
	log_detail varchar(2000) NULL,
	sr_id varchar(15) NULL,
	consecutive_hours bpchar(1) NULL,
	dlr_based_sla bpchar(1) NULL,
	sla_expired_flg bpchar(1) NULL
);


-- landing.cx_chat definition

-- Drop table

-- DROP TABLE landing.cx_chat;

CREATE TABLE landing.cx_chat (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	chat_date timestamp NULL,
	db_last_upd timestamp NULL,
	chat_cd varchar(100) NULL,
	db_last_upd_src varchar(50) NULL,
	description varchar(300) NULL,
	"source" varchar(30) NULL,
	sr_id varchar(15) NULL,
	user_name varchar(100) NULL,
	x_attrib_01 varchar(100) NULL
);


-- landing.cx_chat_message definition

-- Drop table

-- DROP TABLE landing.cx_chat_message;

CREATE TABLE landing.cx_chat_message (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	msg_dt timestamp NULL,
	db_last_upd_src varchar(50) NULL,
	msg_cd varchar(100) NULL,
	msg_text text NULL,
	status varchar(30) NULL,
	x_attrib_01 varchar(100) NULL
);


-- landing.cx_cnt_bnf_xm definition

-- Drop table

-- DROP TABLE landing.cx_cnt_bnf_xm;

CREATE TABLE landing.cx_cnt_bnf_xm (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	x_benefit_use timestamp NULL,
	db_last_upd_src varchar(50) NULL,
	x_account_id varchar(15) NULL,
	x_benefit_name varchar(250) NULL,
	x_src_app varchar(30) NULL,
	x_benefit_url text NULL
);
CREATE UNIQUE INDEX unique_cx_cnt_bnf_xm ON landing.cx_cnt_bnf_xm USING btree (row_id);


-- landing.cx_evt_act_x definition

-- Drop table

-- DROP TABLE landing.cx_evt_act_x;

CREATE TABLE landing.cx_evt_act_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	db_last_upd_src varchar(50) NULL,
	x_attrib_01 varchar(100) NULL,
	x_attrib_02 varchar(1500) NULL,
	x_attrib_03 varchar(300) NULL,
	x_attrib_04 varchar(300) NULL,
	x_attrib_05 timestamp NULL
);
CREATE UNIQUE INDEX unique_cx_evt_act_x ON landing.cx_evt_act_x USING btree (row_id);


-- landing.cx_evt_act_xm definition

-- Drop table

-- DROP TABLE landing.cx_evt_act_xm;

CREATE TABLE landing.cx_evt_act_xm (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	db_last_upd_src varchar(50) NULL,
	x_attrib_01 text NULL,
	x_attrib_02 text NULL
);
CREATE UNIQUE INDEX unique_cx_evt_act_xm ON landing.cx_evt_act_xm USING btree (row_id);


-- landing.cx_sr_mntsrvc_x definition

-- Drop table

-- DROP TABLE landing.cx_sr_mntsrvc_x;

CREATE TABLE landing.cx_sr_mntsrvc_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	db_last_upd timestamp NULL,
	srvc_arrival_date timestamp NULL,
	srvc_delivery_date timestamp NULL,
	srvc_duration int4 NULL,
	srvc_start_date timestamp NULL,
	db_last_upd_src varchar(50) NULL,
	srvc_consultant_id varchar(15) NULL,
	srvc_status_cd varchar(30) NULL,
	srvc_technician_id varchar(15) NULL,
	srvc_type varchar(30) NULL,
	x_sr_response_time int4 NULL
);
CREATE UNIQUE INDEX unique_cx_sr_mntsrvc_x ON landing.cx_sr_mntsrvc_x USING btree (row_id);


-- landing.cx_sr_rsa_x definition

-- Drop table

-- DROP TABLE landing.cx_sr_rsa_x;

CREATE TABLE landing.cx_sr_rsa_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	claim_date timestamp NULL,
	db_last_upd timestamp NULL,
	eff_end_date timestamp NULL,
	eff_start_date timestamp NULL,
	exchange_date timestamp NULL,
	mileage int4 NULL,
	brkdwn_cd varchar(100) NULL,
	brkdwn_desc varchar(1024) NULL,
	brkdwn_nature varchar(100) NULL,
	claim_reason varchar(50) NULL,
	db_last_upd_src varchar(50) NULL,
	integration_id varchar(50) NULL,
	req_document varchar(15) NULL,
	req_first_name varchar(50) NULL,
	req_last_name varchar(50) NULL,
	req_vehicle_rel varchar(30) NULL,
	status_cd varchar(30) NULL
);
CREATE UNIQUE INDEX unique_cx_sr_rsa_x ON landing.cx_sr_rsa_x USING btree (row_id);


-- landing.financing_installment definition

-- Drop table

-- DROP TABLE landing.financing_installment;

CREATE TABLE landing.financing_installment (
	row_id varchar(30) NULL DEFAULT nextval('process.seq_massive_public'::regclass)::text,
	par_row_id varchar(30) NULL,
	chassi varchar(30) NULL,
	produto varchar(30) NULL,
	inicio date NOT NULL,
	fim date NOT NULL,
	prazo varchar(30) NULL,
	parcela varchar(30) NULL,
	ano_fabricacao varchar(30) NULL,
	ano_modelo varchar(30) NULL,
	marca varchar(30) NULL,
	modelo varchar(30) NULL,
	concessionario varchar(50) NULL,
	frase text NULL
);


-- landing.if_account_ws_wf definition

-- Drop table

-- DROP TABLE landing.if_account_ws_wf;

CREATE TABLE landing.if_account_ws_wf (
	row_id serial4 NOT NULL,
	integrationid varchar(30) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	cnpjnumber varchar(30) NULL,
	"name" varchar(100) NULL,
	nickname varchar(100) NULL,
	parentaccountname varchar(100) NULL,
	agencycode varchar(30) NULL,
	fleetacconttype varchar(30) NULL,
	industrytrend varchar(50) NULL,
	numberofemployee varchar(30) NULL,
	totalfleetsize int4 NULL,
	contractedsince date NULL,
	"source" varchar(30) NULL,
	organizationtype varchar(30) NULL,
	mainphonenumber varchar(40) NULL,
	mainfaxnumber varchar(40) NULL,
	mainemailaddress varchar(350) NULL,
	homepage varchar(100) NULL,
	streetaddress varchar(150) NULL,
	streetaddress2 varchar(100) NULL,
	streetaddress3 varchar(100) NULL,
	country varchar(100) NULL,
	city varchar(100) NULL,
	state varchar(50) NULL,
	postalcode varchar(30) NULL,
	description varchar(255) NULL,
	CONSTRAINT if_account_ws_wf_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_account_ws_wf ON landing.if_account_ws_wf USING btree (row_id);


-- landing.if_action_in_ws_wf definition

-- Drop table

-- DROP TABLE landing.if_action_in_ws_wf;

CREATE TABLE landing.if_action_in_ws_wf (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	integrationid varchar(30) NULL DEFAULT 'x'::character varying,
	"result" varchar(100) NULL,
	answer varchar(2000) NULL,
	status varchar(30) NULL,
	hotlineid varchar(50) NULL,
	hotlinecreation date NULL,
	pwaid varchar(50) NULL,
	pwacreation varchar NULL,
	roid varchar(50) NULL,
	rocreation date NULL,
	mobisid varchar(50) NULL,
	mobisstatus varchar(50) NULL,
	expecteddelivery date NULL,
	purchasepurposeid varchar(50) NULL,
	"type" varchar(30) NULL,
	srprotocol varchar(64) NULL,
	priority varchar(30) NULL,
	"owner" varchar(100) NULL,
	description varchar(1500) NULL,
	contactid varchar NULL,
	dealercode varchar(30) NULL,
	serialnumber varchar(100) NULL,
	creationdate timestamptz NULL,
	planneddt timestamptz NULL,
	ordernum varchar(15) NULL,
	dpuser varchar(50) NULL,
	estoque varchar(30) NULL,
	CONSTRAINT if_action_in_ws_wf_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_action_in_ws_wf_integrationid_idx ON landing.if_action_in_ws_wf USING btree (integrationid);
CREATE INDEX if_action_in_ws_wf_srprotocol_idx ON landing.if_action_in_ws_wf USING btree (srprotocol);
CREATE UNIQUE INDEX unique_if_action_in_ws_wf ON landing.if_action_in_ws_wf USING btree (row_id);


-- landing.if_action_in_ws_wf_note definition

-- Drop table

-- DROP TABLE landing.if_action_in_ws_wf_note;

CREATE TABLE landing.if_action_in_ws_wf_note (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	notetype varchar(15) NULL,
	notedate timestamp NULL,
	notedescription varchar(15) NULL,
	notecreator varchar(2000) NULL,
	CONSTRAINT if_action_in_ws_wf_note_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_action_in_ws_wf_note ON landing.if_action_in_ws_wf_note USING btree (row_id);


-- landing.if_action_in_ws_wf_products definition

-- Drop table

-- DROP TABLE landing.if_action_in_ws_wf_products;

CREATE TABLE landing.if_action_in_ws_wf_products (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	partid varchar(50) NULL,
	partqty varchar(10) NULL,
	CONSTRAINT if_action_in_ws_wf_products_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_action_in_ws_wf_products ON landing.if_action_in_ws_wf_products USING btree (row_id);


-- landing.if_action_in_ws_wf_synergyactionaudit definition

-- Drop table

-- DROP TABLE landing.if_action_in_ws_wf_synergyactionaudit;

CREATE TABLE landing.if_action_in_ws_wf_synergyactionaudit (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	fieldname varchar(100) NULL,
	fieldvalue varchar(200) NULL,
	CONSTRAINT if_action_in_ws_wf_synergyactionaudit_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_action_in_ws_wf_synergyactionaudit ON landing.if_action_in_ws_wf_synergyactionaudit USING btree (row_id);


-- landing.if_amaro_csi_survey_answer_ws definition

-- Drop table

-- DROP TABLE landing.if_amaro_csi_survey_answer_ws;

CREATE TABLE landing.if_amaro_csi_survey_answer_ws (
	row_id serial4 NOT NULL,
	par_row_id varchar(15) NULL,
	created date NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd date NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	questionid varchar(30) NULL,
	questioncode varchar(30) NULL,
	questioncomments varchar(1000) NULL,
	answerdescription varchar(1000) NULL,
	answervalue varchar(30) NULL,
	answercomplement varchar(1000) NULL,
	integrationid varchar(30) NULL,
	CONSTRAINT if_amaro_csi_survey_answer_ws_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_amaro_csi_survey_answer_ws_par_row_id_idx ON landing.if_amaro_csi_survey_answer_ws USING btree (par_row_id);
CREATE INDEX if_amaro_csi_survey_answer_ws_questionid_idx ON landing.if_amaro_csi_survey_answer_ws USING btree (questionid);


-- landing.if_amaro_csi_survey_ws definition

-- Drop table

-- DROP TABLE landing.if_amaro_csi_survey_ws;

CREATE TABLE landing.if_amaro_csi_survey_ws (
	row_id serial4 NOT NULL,
	created date NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd date NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	integrationid varchar(30) NULL DEFAULT 'x'::character varying,
	assetid varchar(30) NULL,
	contactid varchar(30) NULL,
	accountid varchar(30) NULL,
	dealerid varchar(30) NULL,
	researchdate date NULL,
	researchname varchar(30) NULL,
	"source" varchar(30) NULL,
	status varchar(30) NULL,
	substatus varchar(30) NULL,
	ratingall varchar(30) NULL,
	ratingattendant varchar(30) NULL,
	ratingmechanic varchar(30) NULL,
	snacode varchar(30) NULL,
	snadate date NULL,
	snatype varchar(30) NULL,
	snacomment varchar NULL,
	srprotocol varchar NULL,
	serialnumber varchar(100) NULL,
	CONSTRAINT if_amaro_csi_survey_ws_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_amaro_csi_survey_ws_integrationid_idx ON landing.if_amaro_csi_survey_ws USING btree (integrationid);
CREATE INDEX if_amaro_csi_survey_ws_source_idx ON landing.if_amaro_csi_survey_ws USING btree (source);
CREATE INDEX if_amaro_csi_survey_ws_srprotocol_idx ON landing.if_amaro_csi_survey_ws USING btree (srprotocol);


-- landing.if_asset_contact_upsert_ws definition

-- Drop table

-- DROP TABLE landing.if_asset_contact_upsert_ws;

CREATE TABLE landing.if_asset_contact_upsert_ws (
	row_id serial4 NOT NULL,
	assetid varchar NULL,
	contactid varchar NULL,
	created timestamp NOT NULL,
	created_by varchar NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	relationship varchar(30) NULL,
	hkmeretaildate timestamp NULL,
	CONSTRAINT if_asset_contact_upsert_ws_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_asset_contact_upsert_ws_assetid_idx ON landing.if_asset_contact_upsert_ws USING btree (assetid);
CREATE UNIQUE INDEX unique_if_asset_contact_upsert_ws ON landing.if_asset_contact_upsert_ws USING btree (row_id);


-- landing.if_auto_vehicle_bluelink_ws definition

-- Drop table

-- DROP TABLE landing.if_auto_vehicle_bluelink_ws;

CREATE TABLE landing.if_auto_vehicle_bluelink_ws (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	chassi varchar(30) NULL,
	integrationid varchar(30) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	activationdate varchar NULL,
	firstactivation varchar(1) NULL,
	"type" varchar(50) NULL,
	latestmileage float8 NULL
);
CREATE INDEX if_auto_vehicle_bluelink_ws_chassi_idx ON landing.if_auto_vehicle_bluelink_ws USING btree (chassi);
CREATE INDEX if_auto_vehicle_bluelink_ws_type_idx ON landing.if_auto_vehicle_bluelink_ws USING btree (type);
CREATE UNIQUE INDEX unique_if_auto_vehicle_bluelink_ws_bl ON landing.if_auto_vehicle_bluelink_ws USING btree (row_id);


-- landing.if_auto_vehicle_rsa_claim_ws definition

-- Drop table

-- DROP TABLE landing.if_auto_vehicle_rsa_claim_ws;

CREATE TABLE landing.if_auto_vehicle_rsa_claim_ws (
	row_id serial4 NOT NULL,
	claimid varchar(50) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"source" varchar(30) NULL,
	requesterfirstname varchar(50) NULL,
	requesterlastname varchar(50) NULL,
	requesterdocument varchar(15) NULL,
	requesterrelationship varchar(30) NULL,
	createdate timestamp NULL,
	reason varchar(50) NULL,
	breakdowndescription varchar(1024) NULL,
	breakdowncode varchar(100) NULL,
	breakdownnature varchar(100) NULL,
	claimstatus varchar(30) NULL,
	serialnumber varchar(100) NULL,
	effectivestartdate timestamp NULL,
	effectiveenddate timestamp NULL,
	exchangedate timestamp NULL,
	vehicleplate varchar(30) NULL,
	vehiclemileage int4 NULL,
	contactid varchar(30) NULL,
	accountid varchar(30) NULL,
	CONSTRAINT if_auto_vehicle_rsa_claim_ws_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_auto_vehicle_rsa_claim_ws ON landing.if_auto_vehicle_rsa_claim_ws USING btree (row_id);


-- landing.if_auto_vehicle_rsa_claim_ws_rsaservice definition

-- Drop table

-- DROP TABLE landing.if_auto_vehicle_rsa_claim_ws_rsaservice;

CREATE TABLE landing.if_auto_vehicle_rsa_claim_ws_rsaservice (
	row_id serial4 NOT NULL,
	serviceid varchar(100) NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	createdate timestamp NULL,
	servicecode varchar(50) NULL,
	specialty varchar(50) NULL,
	provider varchar(255) NULL,
	vehicleproblem varchar(50) NULL,
	problemdescription varchar(2000) NULL,
	tmcpredicted int4 NULL,
	important varchar(2000) NULL,
	requeststatus varchar(50) NULL,
	actuationstatus varchar(50) NULL,
	addressname varchar(255) NULL,
	addressnumber varchar(30) NULL,
	addresscomplement varchar(100) NULL,
	county varchar(100) NULL,
	city varchar(100) NULL,
	state varchar(50) NULL,
	latitude int4 NULL,
	longitude int4 NULL,
	reference varchar(255) NULL,
	zipcode varchar(30) NULL,
	dealername varchar(100) NULL,
	dealernickname varchar(100) NULL,
	expense varchar(30) NULL,
	CONSTRAINT if_auto_vehicle_rsa_claim_ws_rsaservice_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_auto_vehicle_rsa_claim_ws_rsaservice ON landing.if_auto_vehicle_rsa_claim_ws_rsaservice USING btree (row_id);


-- landing.if_auto_vehicle_ws_wf definition

-- Drop table

-- DROP TABLE landing.if_auto_vehicle_ws_wf;

CREATE TABLE landing.if_auto_vehicle_ws_wf (
	row_id serial4 NOT NULL,
	integrationid varchar(30) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	status varchar(30) NULL,
	serialnumber varchar(100) NULL,
	renavamcode varchar(30) NULL,
	enginenumber varchar(50) NULL,
	vehiclelicensenumber varchar(30) NULL,
	fsc_ocn varchar(100) NULL,
	modelname varchar(255) NULL,
	internalcolorcode varchar(30) NULL,
	externalcolorcode varchar(30) NULL,
	fuel varchar(1) NULL,
	purchaseprice int4 NULL,
	manufactureyear varchar(30) NULL,
	mileage int4 NULL,
	saletodealerdate timestamp NULL,
	warrantystartdate timestamp NULL,
	billingdate timestamp NULL,
	delivertocustomerdate timestamp NULL,
	sellingdealercode varchar(30) NULL,
	negotiationtype varchar(30) NULL,
	subscriptiontype varchar(30) NULL,
	fiscalreceipt varchar(100) NULL,
	salesrepid varchar(30) NULL,
	salesrepfirstname varchar(50) NULL,
	salesreplastname varchar(50) NULL,
	modelyear int4 NULL,
	urlphoto varchar(100) NULL,
	urlphotodate timestamp NULL,
	urlauthpublication varchar(255) NULL,
	vehiclelicensedate timestamp NULL,
	digitalsales bpchar(1) NULL,
	deliveryathome bpchar(1) NULL,
	tdathome bpchar(1) NULL,
	ccs_flg bpchar(1) NULL,
	CONSTRAINT if_auto_vehicle_ws_wf_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_auto_vehicle_ws_wf ON landing.if_auto_vehicle_ws_wf USING btree (row_id);


-- landing.if_auto_vehicle_ws_wf_account definition

-- Drop table

-- DROP TABLE landing.if_auto_vehicle_ws_wf_account;

CREATE TABLE landing.if_auto_vehicle_ws_wf_account (
	row_id serial4 NOT NULL,
	connexaccountid varchar NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"type" varchar(30) NULL,
	status varchar(30) NULL,
	serialnumber varchar(100) NULL,
	CONSTRAINT if_auto_vehicle_ws_wf_account_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_auto_vehicle_ws_wf_account ON landing.if_auto_vehicle_ws_wf_account USING btree (row_id);


-- landing.if_auto_vehicle_ws_wf_contact definition

-- Drop table

-- DROP TABLE landing.if_auto_vehicle_ws_wf_contact;

CREATE TABLE landing.if_auto_vehicle_ws_wf_contact (
	row_id serial4 NOT NULL,
	connexcontactid varchar NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"type" varchar(30) NULL,
	status varchar(30) NULL,
	employee bpchar(1) NULL,
	serialnumber varchar(100) NULL,
	CONSTRAINT if_auto_vehicle_ws_wf_contact_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_auto_vehicle_ws_wf_contact ON landing.if_auto_vehicle_ws_wf_contact USING btree (row_id);


-- landing.if_in_channel_partner_inf_wf definition

-- Drop table

-- DROP TABLE landing.if_in_channel_partner_inf_wf;

CREATE TABLE landing.if_in_channel_partner_inf_wf (
	row_id serial4 NOT NULL,
	integrationid varchar(30) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	cnpj varchar(30) NULL,
	"name" varchar(100) NULL,
	nickname varchar(100) NULL,
	partnerflag bpchar(1) NULL,
	reasonstatus varchar(30) NULL,
	dealertype varchar(30) NULL,
	dealercode varchar(30) NULL,
	"location" varchar(50) NULL,
	mainphone varchar(40) NULL,
	fax varchar(40) NULL,
	mainemailaddress varchar(350) NULL,
	workemailaddress varchar(50) NULL,
	salesdealerflag bpchar(1) NULL,
	servicedealerflag bpchar(1) NULL,
	partnerstartdate timestamp NULL,
	region varchar(50) NULL,
	workinghours varchar(50) NULL,
	facebookpage varchar(100) NULL,
	homepage varchar(100) NULL,
	partnerenddate date NULL,
	accountstatus varchar(30) NULL,
	streetaddress varchar(150) NULL,
	streetaddress2 varchar(100) NULL,
	streetaddress3 varchar(100) NULL,
	county varchar(100) NULL,
	city varchar(100) NULL,
	state varchar(50) NULL,
	latitude int4 NULL,
	longitude int4 NULL,
	postalcode varchar(30) NULL,
	dealergroup varchar(30) NULL,
	salesgroup varchar(30) NULL,
	salesmanager varchar(100) NULL,
	servicemanager varchar(100) NULL,
	servicewhatsappnumber varchar(30) NULL,
	saleswhatsappnumber varchar(30) NULL,
	salesdistrict varchar(30) NULL,
	salesoffice varchar(30) NULL,
	division varchar(30) NULL,
	CONSTRAINT if_in_channel_partner_inf_wf_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_in_channel_partner_inf_wf_integrationid_idx ON landing.if_in_channel_partner_inf_wf USING btree (integrationid);
CREATE UNIQUE INDEX unique_if_in_channel_partner_inf_wf ON landing.if_in_channel_partner_inf_wf USING btree (row_id);


-- landing.if_in_channel_partner_inf_wf_businessaddress definition

-- Drop table

-- DROP TABLE landing.if_in_channel_partner_inf_wf_businessaddress;

CREATE TABLE landing.if_in_channel_partner_inf_wf_businessaddress (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	addressname varchar(100) NULL,
	streetaddress varchar(150) NULL,
	streetaddress2 varchar(100) NULL,
	streetaddress3 varchar(100) NULL,
	country varchar(100) NULL,
	city varchar(100) NULL,
	state varchar(50) NULL,
	latitude int4 NULL,
	longitude int4 NULL,
	zipcode varchar(30) NULL,
	CONSTRAINT if_in_channel_partner_inf_wf_businessaddress_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_channel_partner_inf_wf_businessaddress ON landing.if_in_channel_partner_inf_wf_businessaddress USING btree (row_id);


-- landing.if_in_channel_partner_inf_wf_dlrcontact definition

-- Drop table

-- DROP TABLE landing.if_in_channel_partner_inf_wf_dlrcontact;

CREATE TABLE landing.if_in_channel_partner_inf_wf_dlrcontact (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	integrationid varchar(30) NULL,
	cpf varchar(30) NULL,
	firstname varchar(50) NULL,
	lastname varchar(50) NULL,
	email varchar(350) NULL,
	homephone varchar(40) NULL,
	workphone varchar(40) NULL,
	jobtitle varchar(75) NULL,
	notes varchar(200) NULL,
	sanitizedflag bpchar(1) NULL,
	status varchar(30) NULL,
	contacttype varchar(30) NULL,
	partytypecode varchar(30) NULL,
	cellphone varchar NULL,
	account_row_id varchar(30) NULL,
	CONSTRAINT if_in_channel_partner_inf_wf_dlrcontact_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_channel_partner_inf_wf_dlrcontact ON landing.if_in_channel_partner_inf_wf_dlrcontact USING btree (row_id);


-- landing.if_in_channel_partner_inf_wf_position definition

-- Drop table

-- DROP TABLE landing.if_in_channel_partner_inf_wf_position;

CREATE TABLE landing.if_in_channel_partner_inf_wf_position (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"position" varchar(100) NULL,
	CONSTRAINT if_in_channel_partner_inf_wf_position_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_channel_partner_inf_wf_position ON landing.if_in_channel_partner_inf_wf_position USING btree (row_id);


-- landing.if_in_channel_partner_inf_wf_type definition

-- Drop table

-- DROP TABLE landing.if_in_channel_partner_inf_wf_type;

CREATE TABLE landing.if_in_channel_partner_inf_wf_type (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	partnertype varchar(30) NULL,
	CONSTRAINT if_in_channel_partner_inf_wf_type_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_channel_partner_inf_wf_type ON landing.if_in_channel_partner_inf_wf_type USING btree (row_id);


-- landing.if_in_color_ws definition

-- Drop table

-- DROP TABLE landing.if_in_color_ws;

CREATE TABLE landing.if_in_color_ws (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"source" varchar(250) NULL,
	CONSTRAINT if_in_color_ws_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_color_ws ON landing.if_in_color_ws USING btree (row_id);


-- landing.if_in_color_ws_color definition

-- Drop table

-- DROP TABLE landing.if_in_color_ws_color;

CREATE TABLE landing.if_in_color_ws_color (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"type" varchar(30) NULL,
	code varchar(50) NULL,
	description_em varchar(30) NULL,
	description_pt varchar(30) NULL,
	color_type varchar(100) NULL,
	color_description varchar(100) NULL,
	CONSTRAINT if_in_color_ws_color_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_color_ws_color ON landing.if_in_color_ws_color USING btree (row_id);


-- landing.if_in_contact_inf_wf definition

-- Drop table

-- DROP TABLE landing.if_in_contact_inf_wf;

CREATE TABLE landing.if_in_contact_inf_wf (
	row_id serial4 NOT NULL,
	integrationid varchar(30) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	cpf varchar(30) NULL,
	firstname varchar(50) NULL,
	lastname varchar(50) NULL,
	birthdate date NULL,
	gender varchar(30) NULL,
	"source" varchar(100) NULL,
	homephone varchar(40) NULL,
	workphone varchar(40) NULL,
	cellphone varchar(40) NULL,
	emailaddress varchar(350) NULL,
	wayofcontact varchar(30) NULL,
	occupation varchar(50) NULL,
	maritalstatus varchar(30) NULL,
	income varchar(50) NULL,
	carofinterest varchar(100) NULL,
	calledby varchar(30) NULL,
	literacy varchar(30) NULL,
	behavioralsegment varchar(30) NULL,
	valuesegment varchar(30) NULL,
	googlesegment varchar(30) NULL,
	facebooksegment varchar(30) NULL,
	lifecyclesegment varchar(30) NULL,
	contactoptin bpchar(1) NULL,
	streetaddress varchar(150) NULL,
	streetaddress2 varchar(100) NULL,
	streetaddress3 varchar(100) NULL,
	country varchar(100) NULL,
	city varchar(100) NULL,
	state varchar(50) NULL,
	postalcode varchar(30) NULL,
	suppressallcalls bpchar(1) NULL,
	suppressallmailings bpchar(1) NULL,
	suppressallemails bpchar(1) NULL,
	suppressallsms bpchar(1) NULL,
	printedcard bpchar(1) NULL,
	already_customer bpchar(1) NULL DEFAULT 'N'::bpchar,
	interestsegment varchar(30) NULL,
	suppressallvideocall bpchar(1) NULL,
	suppressallwhatsapp bpchar(1) NULL,
	suppressallmobile bpchar(1) NULL,
	favorite_dealer varchar(30) NULL,
	CONSTRAINT if_in_contact_inf_wf_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_contact_inf_wf ON landing.if_in_contact_inf_wf USING btree (row_id);


-- landing.if_in_contact_inf_wf_app definition

-- Drop table

-- DROP TABLE landing.if_in_contact_inf_wf_app;

CREATE TABLE landing.if_in_contact_inf_wf_app (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"name" varchar(100) NULL,
	startdate timestamp NULL,
	status varchar(30) NULL,
	CONSTRAINT if_in_contact_inf_wf_app_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_contact_inf_wf_app ON landing.if_in_contact_inf_wf_app USING btree (row_id);


-- landing.if_in_contact_inf_wf_car definition

-- Drop table

-- DROP TABLE landing.if_in_contact_inf_wf_car;

CREATE TABLE landing.if_in_contact_inf_wf_car (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"name" varchar(100) NULL,
	yearmodel varchar(30) NULL,
	intentiontochange varchar(30) NULL,
	iscurrent bpchar(1) NULL,
	carmodel varchar(30) NULL,
	mileage int4 NULL,
	clientexpectedvalue int4 NULL,
	CONSTRAINT if_in_contact_inf_wf_car_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_contact_inf_wf_car ON landing.if_in_contact_inf_wf_car USING btree (row_id);


-- landing.if_in_contact_inf_wf_hobby definition

-- Drop table

-- DROP TABLE landing.if_in_contact_inf_wf_hobby;

CREATE TABLE landing.if_in_contact_inf_wf_hobby (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	description varchar(100) NULL,
	CONSTRAINT if_in_contact_inf_wf_hobby_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_contact_inf_wf_hobby ON landing.if_in_contact_inf_wf_hobby USING btree (row_id);


-- landing.if_in_contact_inf_wf_soccerteam definition

-- Drop table

-- DROP TABLE landing.if_in_contact_inf_wf_soccerteam;

CREATE TABLE landing.if_in_contact_inf_wf_soccerteam (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"name" varchar(100) NULL,
	CONSTRAINT if_in_contact_inf_wf_soccerteam_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_contact_inf_wf_soccerteam ON landing.if_in_contact_inf_wf_soccerteam USING btree (row_id);


-- landing.if_in_contact_inf_wf_socialmedia definition

-- Drop table

-- DROP TABLE landing.if_in_contact_inf_wf_socialmedia;

CREATE TABLE landing.if_in_contact_inf_wf_socialmedia (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"name" varchar(100) NULL,
	"user" varchar(50) NULL,
	joindate timestamp NULL,
	likehmb bpchar(1) NULL,
	CONSTRAINT if_in_contact_inf_wf_socialmedia_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_in_contact_inf_wf_socialmedia ON landing.if_in_contact_inf_wf_socialmedia USING btree (row_id);


-- landing.if_in_rental_car_rq_rs definition

-- Drop table

-- DROP TABLE landing.if_in_rental_car_rq_rs;

CREATE TABLE landing.if_in_rental_car_rq_rs (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	"name" varchar(80) NULL,
	rental_status varchar(255) NULL,
	deltaprotocolnumber varchar(100) NULL,
	confirmedmodelofrentalcar varchar(100) NULL,
	confirmedrentalstartdate timestamp NULL,
	confirmedrentalenddate timestamp NULL
);


-- landing.if_in_repair_order definition

-- Drop table

-- DROP TABLE landing.if_in_repair_order;

CREATE TABLE landing.if_in_repair_order (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	soid varchar(20) NULL,
	dealercode varchar(10) NULL,
	vincode varchar NULL,
	mileage float8 NULL,
	model varchar(40) NULL,
	zyear int4 NULL,
	plate varchar(8) NULL,
	status int2 NULL,
	quicksrv varchar(1) NULL,
	consult_cpf varchar(20) NULL,
	consult_name varchar(30) NULL,
	opendt varchar(14) NULL,
	closedt varchar(14) NULL,
	canceldt varchar(14) NULL,
	deliverydt varchar(14) NULL,
	schedulingdt varchar(14) NULL,
	"comments" varchar(255) NULL,
	filesentdt varchar(14) NULL,
	total_worked_hours float8 NULL,
	total_sold_hours float8 NULL,
	total_value float8 NULL,
	partner varchar NULL,
	firstname varchar(40) NULL,
	lastname varchar(40) NULL,
	cpf varchar(20) NULL,
	city varchar(40) NULL,
	postl_cod1 varchar(10) NULL,
	street varchar(60) NULL,
	house_no varchar(10) NULL,
	country varchar(3) NULL,
	region varchar(3) NULL,
	taxjurcode varchar(15) NULL,
	email varchar(241) NULL,
	tel_number varchar(30) NULL,
	mob_number varchar(30) NULL,
	blockcontact varchar(1) NULL,
	queried varchar(8) NULL,
	ernam varchar(12) NULL,
	erdat date NULL,
	erzet time NULL,
	aenam varchar(12) NULL,
	aedat date NULL,
	aezet time NULL
);
CREATE INDEX if_in_repair_order_dealercode_idx ON landing.if_in_repair_order USING btree (dealercode);
CREATE INDEX if_in_repair_order_row_id_idx ON landing.if_in_repair_order USING btree (row_id);
CREATE INDEX if_in_repair_order_soid_idx ON landing.if_in_repair_order USING btree (soid);
CREATE INDEX if_in_repair_order_vincode_idx ON landing.if_in_repair_order USING btree (vincode);


-- landing.if_in_repair_order_service definition

-- Drop table

-- DROP TABLE landing.if_in_repair_order_service;

CREATE TABLE landing.if_in_repair_order_service (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	soid varchar(20) NULL,
	dealercode varchar(10) NULL,
	vincode varchar NULL,
	itmnum varchar(5) NULL,
	sotype varchar(255) NULL,
	codsrc varchar(15) NULL,
	zdesc varchar NULL,
	zqty float8 NULL,
	unit varchar(3) NULL,
	value float8 NULL,
	total_value float8 NULL,
	ernam varchar(12) NULL,
	erdat date NULL,
	erzet time NULL,
	aenam varchar(12) NULL,
	aedat date NULL,
	aezet time NULL
);
CREATE INDEX if_in_repair_order_service_dealercode_idx ON landing.if_in_repair_order_service USING btree (dealercode);
CREATE INDEX if_in_repair_order_service_par_row_id_idx ON landing.if_in_repair_order_service USING btree (par_row_id);
CREATE INDEX if_in_repair_order_service_row_id_idx ON landing.if_in_repair_order_service USING btree (row_id);
CREATE INDEX if_in_repair_order_service_soid_idx ON landing.if_in_repair_order_service USING btree (soid);
CREATE INDEX if_in_repair_order_service_vincode_idx ON landing.if_in_repair_order_service USING btree (vincode);


-- landing.if_in_repair_parts definition

-- Drop table

-- DROP TABLE landing.if_in_repair_parts;

CREATE TABLE landing.if_in_repair_parts (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	soid varchar(20) NULL,
	dealercode varchar(10) NULL,
	vincode varchar(17) NULL,
	itmnum varchar(5) NULL,
	sotype varchar(255) NULL,
	pncode varchar(20) NULL,
	zdesc varchar(30) NULL,
	zqty float8 NULL,
	unit varchar(3) NULL,
	value float8 NULL,
	total_value float8 NULL,
	ernam varchar(12) NULL,
	erdat date NULL,
	erzet time NULL,
	aenam varchar(12) NULL,
	aedat date NULL,
	aezet time NULL
);
CREATE INDEX if_in_repair_parts_dealercode_idx ON landing.if_in_repair_parts USING btree (dealercode);
CREATE INDEX if_in_repair_parts_par_row_id_idx ON landing.if_in_repair_parts USING btree (par_row_id);
CREATE INDEX if_in_repair_parts_row_id_idx ON landing.if_in_repair_parts USING btree (row_id);
CREATE INDEX if_in_repair_parts_soid_idx ON landing.if_in_repair_parts USING btree (soid);
CREATE INDEX if_in_repair_parts_vincode_idx ON landing.if_in_repair_parts USING btree (vincode);


-- landing.if_mntsrvc_manage_dlr_holiday definition

-- Drop table

-- DROP TABLE landing.if_mntsrvc_manage_dlr_holiday;

CREATE TABLE landing.if_mntsrvc_manage_dlr_holiday (
	row_id serial4 NOT NULL,
	"source" varchar(50) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	holiday_description varchar(100) NULL,
	holiday_date date NULL,
	dealer_code varchar(30) NULL,
	operation varchar(30) NULL,
	CONSTRAINT if_mntsrvc_manage_dlr_holiday_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_mntsrvc_manage_dlr_holiday ON landing.if_mntsrvc_manage_dlr_holiday USING btree (row_id);


-- landing.if_mntsrvc_manage_dlr_svc definition

-- Drop table

-- DROP TABLE landing.if_mntsrvc_manage_dlr_svc;

CREATE TABLE landing.if_mntsrvc_manage_dlr_svc (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	dealer_code varchar(30) NULL,
	"source" varchar(30) NULL,
	CONSTRAINT if_mntsrvc_manage_dlr_svc_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_mntsrvc_manage_dlr_svc ON landing.if_mntsrvc_manage_dlr_svc USING btree (row_id);


-- landing.if_mntsrvc_manage_dlr_svc_service definition

-- Drop table

-- DROP TABLE landing.if_mntsrvc_manage_dlr_svc_service;

CREATE TABLE landing.if_mntsrvc_manage_dlr_svc_service (
	row_id serial4 NOT NULL,
	par_row_id varchar(30) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	service_type varchar(30) NULL,
	service_length int4 NULL,
	CONSTRAINT if_mntsrvc_manage_dlr_svc_service_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_mntsrvc_manage_dlr_svc_service ON landing.if_mntsrvc_manage_dlr_svc_service USING btree (row_id);


-- landing.if_mntsrvc_manage_emp_avail definition

-- Drop table

-- DROP TABLE landing.if_mntsrvc_manage_emp_avail;

CREATE TABLE landing.if_mntsrvc_manage_emp_avail (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"source" varchar(50) NULL,
	employee_cpf varchar(30) NULL,
	dealer_code varchar(30) NULL,
	CONSTRAINT if_mntsrvc_manage_emp_avail_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_mntsrvc_manage_emp_avail ON landing.if_mntsrvc_manage_emp_avail USING btree (row_id);


-- landing.if_mntsrvc_manage_emp_avail_day definition

-- Drop table

-- DROP TABLE landing.if_mntsrvc_manage_emp_avail_day;

CREATE TABLE landing.if_mntsrvc_manage_emp_avail_day (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	day_name varchar(30) NULL,
	period1_start varchar(30) NULL,
	period1_end varchar(30) NULL,
	period2_start varchar(30) NULL,
	period2_end varchar(30) NULL,
	period3_start varchar(30) NULL,
	period3_end varchar(30) NULL,
	CONSTRAINT if_mntsrvc_manage_emp_avail_day_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_mntsrvc_manage_emp_avail_day ON landing.if_mntsrvc_manage_emp_avail_day USING btree (row_id);


-- landing.if_mntsrvc_manage_emp_avail_excp definition

-- Drop table

-- DROP TABLE landing.if_mntsrvc_manage_emp_avail_excp;

CREATE TABLE landing.if_mntsrvc_manage_emp_avail_excp (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	operation varchar(30) NULL,
	excp_id varchar(30) NULL,
	employee_cpf varchar(30) NULL,
	dealer_code varchar(30) NULL,
	excp_start_date timestamp NULL,
	excp_end_date timestamp NULL,
	absence_period bpchar(1) NULL,
	period1_start varchar(30) NULL,
	period1_end varchar(30) NULL,
	period2_start varchar(30) NULL,
	period2_end varchar(30) NULL,
	period3_start varchar(30) NULL,
	period3_end varchar(30) NULL,
	excp_desc varchar(100) NULL,
	"source" varchar(30) NULL,
	CONSTRAINT if_mntsrvc_manage_emp_avail_excp_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_mntsrvc_manage_emp_avail_excp ON landing.if_mntsrvc_manage_emp_avail_excp USING btree (row_id);


-- landing.if_mntsrvc_schedule_maintenance definition

-- Drop table

-- DROP TABLE landing.if_mntsrvc_schedule_maintenance;

CREATE TABLE landing.if_mntsrvc_schedule_maintenance (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"source" varchar(50) NULL,
	srnumber varchar(64) NULL,
	srreason varchar(30) NULL,
	srlevel1 varchar(30) NULL,
	srlevel2 varchar(30) NULL,
	srlevel3 varchar(30) NULL,
	srlevel4 varchar(30) NULL,
	srsource varchar(50) NULL,
	srmethod varchar(30) NULL,
	srdescription varchar(2000) NULL,
	srpriority varchar(30) NULL,
	srstatus varchar(30) NULL,
	dealercode varchar(30) NULL,
	chassis varchar(30) NULL,
	customercpf varchar(30) NULL,
	consultantcpf varchar(30) NULL,
	techniciancpf varchar(30) NULL,
	servicetype varchar(30) NULL,
	servicestatus varchar(30) NULL,
	servicearrivaldate timestamp NULL,
	servicestartdate timestamp NULL,
	serviceduration int4 NULL,
	servicedeliverydate timestamp NULL,
	CONSTRAINT if_mntsrvc_schedule_maintenance_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_mntsrvc_schedule_maintenance ON landing.if_mntsrvc_schedule_maintenance USING btree (row_id);


-- landing.if_product_in_wf definition

-- Drop table

-- DROP TABLE landing.if_product_in_wf;

CREATE TABLE landing.if_product_in_wf (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"name" varchar(100) NULL,
	"source" varchar(30) NULL,
	"type" varchar(30) NULL,
	part varchar(50) NULL,
	advdesc varchar(2000) NULL,
	modelyear int4 NULL,
	chassimodel varchar(50) NULL,
	bodystyle varchar(30) NULL,
	hmbcylindercapacity varchar(30) NULL,
	engine varchar(30) NULL,
	enginedesc varchar(50) NULL,
	versiondesc varchar(50) NULL,
	transmissiondesc varchar(50) NULL,
	transmission varchar(30) NULL,
	fuel varchar(30) NULL,
	doorsamnt int4 NULL,
	suggestedprice float8 NULL,
	description varchar(255) NULL,
	producttypecode varchar(30) NULL,
	CONSTRAINT if_product_in_wf_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_product_in_wf ON landing.if_product_in_wf USING btree (row_id);


-- landing.if_product_list_in_wf definition

-- Drop table

-- DROP TABLE landing.if_product_list_in_wf;

CREATE TABLE landing.if_product_list_in_wf (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"source" varchar(30) NULL,
	CONSTRAINT if_product_list_in_wf_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_product_list_in_wf ON landing.if_product_list_in_wf USING btree (row_id);


-- landing.if_product_list_in_wf_product definition

-- Drop table

-- DROP TABLE landing.if_product_list_in_wf_product;

CREATE TABLE landing.if_product_list_in_wf_product (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"name" varchar(100) NULL,
	"type" varchar(30) NULL,
	suggestedprice int4 NULL,
	"source" varchar(30) NULL,
	CONSTRAINT if_product_list_in_wf_product_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_product_list_in_wf_product ON landing.if_product_list_in_wf_product USING btree (row_id);


-- landing.if_reclaimaqui_retrieve_ticket_by_id definition

-- Drop table

-- DROP TABLE landing.if_reclaimaqui_retrieve_ticket_by_id;

CREATE TABLE landing.if_reclaimaqui_retrieve_ticket_by_id (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	id varchar(30) NULL,
	source_external_id varchar(30) NULL,
	can_like varchar(30) NULL,
	commentary varchar(30) NULL,
	creation_date timestamp NULL,
	insertion_date timestamp NULL,
	complaint_title varchar(255) NULL,
	filed varchar(30) NULL,
	last_modification_date timestamp NULL,
	closed_date timestamp NULL,
	request_moderation varchar(30) NULL,
	request_evaluation varchar(30) NULL,
	frozen varchar(30) NULL,
	complaint_content varchar(255) NULL,
	ra_reason varchar(100) NULL,
	ra_feeling varchar(100) NULL,
	complaint_response_content varchar(255) NULL,
	complaint_response_date timestamp NULL,
	interactions_count int4 NULL,
	interactions_not_readed_count int4 NULL,
	resolved_issue varchar(30) NULL,
	back_doing_business varchar(30) NULL,
	consumer_consideration varchar(30) NULL,
	consumer_consideration_date varchar(50) NULL,
	company_consideration varchar NULL,
	company_consideration_date timestamp NULL,
	private_treatment_time varchar(30) NULL,
	public_treatment_time varchar(30) NULL,
	rating_time varchar(30) NULL,
	rating varchar(30) NULL,
	rating_date timestamp NULL,
	comments_count int4 NULL,
	redistributions_count int4 NULL,
	redistributions_reason varchar(100) NULL,
	ticket_moderations_count int4 NULL,
	ticket_messages_count int4 NULL,
	last_replica_date timestamp NULL,
	contact_us varchar(30) NULL,
	rating_without_response varchar(30) NULL,
	hugme_ticket_type varchar(30) NULL,
	customer_interactions_count int4 NULL,
	company_interactions_count int4 NULL,
	company varchar(30) NULL,
	customer varchar(30) NULL,
	moderation varchar(30) NULL,
	personalized_fields varchar(30) NULL,
	reclame_aqui varchar(30) NULL,
	ra_status varchar(30) NULL,
	rafone varchar(30) NULL,
	assignment_count int4 NULL,
	favorable_assessment varchar(30) NULL,
	feed_type varchar(30) NULL,
	historical varchar(30) NULL,
	hugme_status varchar(30) NULL,
	information_source varchar(30) NULL,
	"source" varchar(30) NULL,
	tags varchar(30) NULL,
	ticket_detail_type_id varchar(30) NULL,
	ticket_interaction_type varchar(30) NULL,
	last_feeling varchar(100) NULL,
	moderation_status varchar(100) NULL,
	moderation_reason varchar(100) NULL,
	moderation_request_date varchar(100) NULL,
	moderation_response_date varchar(100) NULL,
	replicas_count int4 NULL,
	source_id int4 NULL,
	source_name varchar(100) NULL,
	deactivation_date varchar(100) NULL,
	deactivation_reason varchar(100) NULL,
	internal_process varchar(100) NULL,
	blackfriday varchar(100) NULL,
	username varchar(100) NULL,
	userassignmentdate varchar(100) NULL,
	account varchar(30) NULL,
	rafone_expiration_date varchar(100) NULL,
	rafone_status_id varchar(100) NULL,
	rafone_status_name varchar(100) NULL,
	rule_id varchar(100) NULL,
	active varchar(100) NULL,
	ra_moderation_request_message varchar NULL,
	customerid varchar(30) NULL,
	moderationreason varchar(255) NULL,
	moderationstatus varchar(50) NULL,
	moderationrequestdate timestamp NULL,
	moderationresponsedate timestamp NULL,
	birthday date NULL,
	cpf varchar(30) NULL,
	rg varchar(255) NULL,
	gender varchar(255) NULL,
	email varchar(80) NULL,
	phonenumbers varchar(40) NULL,
	firstname varchar(50) NULL,
	lastname varchar(80) NULL,
	city varchar(40) NULL,
	address_state varchar(80) NULL,
	attach_detail_description varchar(1000) NULL,
	attach_name varchar(255) NULL,
	attach_creation_date timestamp NULL,
	ra_moderation_response_message varchar(1000) NULL
);


-- landing.if_register_in_app_ws definition

-- Drop table

-- DROP TABLE landing.if_register_in_app_ws;

CREATE TABLE landing.if_register_in_app_ws (
	row_id serial4 NOT NULL,
	contactid varchar NOT NULL,
	created timestamp NOT NULL,
	created_by varchar NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	appsource varchar(30) NULL,
	appstatus varchar(30) NULL,
	CONSTRAINT if_register_in_app_ws_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_register_in_app_ws ON landing.if_register_in_app_ws USING btree (row_id);


-- landing.if_register_loyalty_bnf_used_ws definition

-- Drop table

-- DROP TABLE landing.if_register_loyalty_bnf_used_ws;

CREATE TABLE landing.if_register_loyalty_bnf_used_ws (
	row_id serial4 NOT NULL,
	contactid varchar(15) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	partnername varchar(15) NULL,
	partnercnpj varchar(30) NULL,
	partnerexternalid varchar(15) NULL,
	benefitname varchar(250) NULL,
	benefiturl text NULL,
	appsource varchar(30) NULL,
	CONSTRAINT if_register_loyalty_bnf_used_ws_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_register_loyalty_bnf_used_ws ON landing.if_register_loyalty_bnf_used_ws USING btree (row_id);


-- landing.if_service_request_attachment definition

-- Drop table

-- DROP TABLE landing.if_service_request_attachment;

CREATE TABLE landing.if_service_request_attachment (
	row_id serial4 NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	url varchar(200) NULL,
	srnumber varchar(64) NULL,
	CONSTRAINT if_service_request_attachment_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_service_request_attachment ON landing.if_service_request_attachment USING btree (row_id);


-- landing.if_service_request_chat_ws definition

-- Drop table

-- DROP TABLE landing.if_service_request_chat_ws;

CREATE TABLE landing.if_service_request_chat_ws (
	row_id serial4 NOT NULL,
	protocol varchar(64) NULL,
	contactdid varchar NULL,
	accountid varchar NULL,
	dealerid varchar(30) NULL,
	integrationid varchar(30) NULL,
	salesrepid varchar(30) NULL,
	campaignid varchar(15) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	reason varchar(30) NULL,
	level1 varchar(30) NULL,
	level2 varchar(30) NULL,
	level3 varchar(30) NULL,
	level4 varchar(30) NULL,
	"source" varchar(50) NULL,
	"method" varchar(30) NULL,
	description varchar(2000) NULL,
	status varchar(30) NULL,
	priority varchar(30) NULL,
	solution varchar(30) NULL,
	serialnumber varchar(100) NULL,
	anonymousflag bpchar(1) NULL,
	tendency varchar(30) NULL,
	satisfaction varchar(100) NULL,
	causingarea varchar(30) NULL,
	imobilizationdate timestamp NULL,
	relatedmodel varchar(30) NULL,
	quotedescription varchar(2000) NULL,
	enginetransmission varchar(100) NULL,
	"version" varchar(100) NULL,
	versionprice varchar(100) NULL,
	color varchar(100) NULL,
	colorprice varchar(100) NULL,
	finalprice varchar(100) NULL,
	carreplacementintention varchar(100) NULL,
	roadservicerequest varchar(50) NULL,
	tdconfirmed bpchar(1) NULL,
	tdtime varchar(30) NULL,
	tddate timestamp NULL,
	pneflag bpchar(1) NULL,
	sourcetag varchar(60) NULL,
	estoque varchar(30) NULL,
	medium varchar(60) NULL,
	"content" varchar(60) NULL,
	campaign varchar(60) NULL,
	additionalcomments varchar(500) NULL,
	causingperson varchar(30) NULL,
	custrepresentative varchar(100) NULL,
	custrepresentativerel varchar(30) NULL,
	diagnosisdifficultyflg bpchar(1) NULL,
	diagnosispendingflg bpchar(1) NULL,
	dlrdescription varchar(500) NULL,
	dlrfup varchar(500) NULL,
	dlrpending varchar(500) NULL,
	dlrretractionflg bpchar(1) NULL,
	dlrreversal varchar(500) NULL,
	hotlineflg bpchar(1) NULL,
	hotlinenum varchar(30) NULL,
	hotlineopendt timestamp NULL,
	purchaseproposalnum varchar(30) NULL,
	pwaflg bpchar(1) NULL,
	pwanum varchar(30) NULL,
	pwaopendt timestamp NULL,
	recurrenceflg bpchar(1) NULL,
	recurrencenum int4 NULL,
	vehicledeliverydt timestamp NULL,
	vehicledeliveryflg bpchar(1) NULL,
	wantsloan bpchar(1) NULL,
	loantype varchar(50) NULL,
	installmentsamt int4 NULL,
	downpayment int4 NULL,
	usedcarasdownpaymnt bpchar(1) NULL,
	dlrtemperature bpchar(1) NULL,
	ownedbyid varchar(30) NULL,
	contactid varchar NULL,
	CONSTRAINT if_service_request_chat_ws_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_service_request_chat_ws_level1_idx ON landing.if_service_request_chat_ws USING btree (level1);
CREATE INDEX if_service_request_chat_ws_level2_idx ON landing.if_service_request_chat_ws USING btree (level2);
CREATE INDEX if_service_request_chat_ws_protocol_idx ON landing.if_service_request_chat_ws USING btree (protocol);
CREATE INDEX if_service_request_chat_ws_reason_idx ON landing.if_service_request_chat_ws USING btree (reason);
CREATE UNIQUE INDEX unique_if_service_request_chat_ws ON landing.if_service_request_chat_ws USING btree (row_id);


-- landing.if_service_request_chat_ws_chat definition

-- Drop table

-- DROP TABLE landing.if_service_request_chat_ws_chat;

CREATE TABLE landing.if_service_request_chat_ws_chat (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	chatcode varchar(100) NULL,
	"date" timestamp NULL,
	"source" varchar(30) NULL,
	"operator" varchar(100) NULL,
	CONSTRAINT if_service_request_chat_ws_chat_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_service_request_chat_ws_chat_par_row_id_idx ON landing.if_service_request_chat_ws_chat USING btree (par_row_id);
CREATE UNIQUE INDEX unique_if_service_request_chat_ws_chat ON landing.if_service_request_chat_ws_chat USING btree (row_id);


-- landing.if_service_request_chat_ws_message definition

-- Drop table

-- DROP TABLE landing.if_service_request_chat_ws_message;

CREATE TABLE landing.if_service_request_chat_ws_message (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	msgcode varchar(100) NULL,
	"date" timestamp NULL,
	sentby varchar(30) NULL,
	msg varchar(1500) NULL,
	msgstatus varchar(30) NULL,
	CONSTRAINT if_service_request_chat_ws_message_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_service_request_chat_ws_message_par_row_id_idx ON landing.if_service_request_chat_ws_message USING btree (par_row_id);
CREATE UNIQUE INDEX unique_if_service_request_chat_ws_message ON landing.if_service_request_chat_ws_message USING btree (row_id);


-- landing.if_service_request_ws_wf definition

-- Drop table

-- DROP TABLE landing.if_service_request_ws_wf;

CREATE TABLE landing.if_service_request_ws_wf (
	row_id serial4 NOT NULL,
	protocol varchar(64) NULL,
	reason varchar(30) NULL,
	level1 varchar(30) NULL,
	level2 varchar(30) NULL,
	level3 varchar(30) NULL,
	level4 varchar(30) NULL,
	"source" varchar(50) NULL,
	"method" varchar(30) NULL,
	description varchar(2000) NULL,
	status varchar(30) NULL,
	priority varchar(30) NULL,
	solution varchar(30) NULL,
	serialnumber varchar(100) NULL,
	anonymousflag bpchar(1) NULL,
	contactid varchar NULL,
	accountid varchar NULL,
	tendency varchar(30) NULL,
	satisfaction varchar(100) NULL,
	dealerid varchar(30) NULL,
	causingarea varchar(30) NULL,
	imobilizationdate timestamp NULL,
	relatedmodel varchar(30) NULL,
	quotedescription varchar(2000) NULL,
	enginetransmission varchar(100) NULL,
	"version" varchar(100) NULL,
	versionprice varchar(100) NULL,
	color varchar(100) NULL,
	colorprice varchar(100) NULL,
	finalprice varchar(100) NULL,
	carreplacementintention varchar(100) NULL,
	roadservicerequest varchar(30) NULL,
	integrationid varchar(30) NULL,
	tdconfirmed bpchar(1) NULL,
	tdtime varchar(30) NULL,
	tddate timestamp NULL,
	salesrepid varchar(30) NULL,
	pneflag bpchar(1) NULL,
	campaignid varchar(15) NULL,
	sourcetag varchar(60) NULL,
	estoque varchar(30) NULL,
	medium varchar(60) NULL,
	"content" varchar(60) NULL,
	campaign varchar(60) NULL,
	additionalcomments varchar(500) NULL,
	causingperson varchar(30) NULL,
	custrepresentative varchar(100) NULL,
	custrepresentativerel varchar(30) NULL,
	diagnosisdifficultyflg bpchar(1) NULL,
	diagnosispendingflg bpchar(1) NULL,
	dlrdescription varchar(500) NULL,
	dlrfup varchar(500) NULL,
	dlrpending varchar(500) NULL,
	dlrretractionflg bpchar(1) NULL,
	dlrreversal varchar(500) NULL,
	hotlineflg bpchar(1) NULL,
	hotlinenum varchar(30) NULL,
	hotlineopendt timestamp NULL,
	purchaseproposalnum varchar(30) NULL,
	pwaflg bpchar(1) NULL,
	pwanum varchar(30) NULL,
	pwaopendt timestamp NULL,
	recurrenceflg bpchar(1) NULL,
	recurrencenum int4 NULL,
	vehicledeliverydt timestamp NULL,
	vehicledeliveryflg bpchar(1) NULL,
	wantsloan bpchar(1) NULL,
	loantype varchar(50) NULL,
	installmentsamt int4 NULL,
	downpayment int4 NULL,
	usedcarasdownpaymnt bpchar(1) NULL,
	dlrtemperature bpchar(1) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	paymnt_date timestamp NULL,
	paymnt_method varchar(22) NULL,
	paymnt_status varchar(22) NULL,
	reservation_amount varchar(22) NULL,
	form varchar(30) NULL,
	sched_dt timestamp NULL,
	sched_type varchar(30) NULL,
	used_brand varchar(100) NULL,
	used_chassi varchar(50) NULL,
	used_color varchar(30) NULL,
	used_km varchar(30) NULL,
	used_max_price varchar(30) NULL,
	used_med_price varchar(30) NULL,
	used_min_price varchar(30) NULL,
	used_model varchar(100) NULL,
	used_plate varchar(30) NULL,
	used_version varchar(100) NULL,
	used_year varchar(30) NULL,
	CONSTRAINT if_service_request_ws_wf_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_service_request_ws_wf_level1_idx ON landing.if_service_request_ws_wf USING btree (level1);
CREATE INDEX if_service_request_ws_wf_level2_idx ON landing.if_service_request_ws_wf USING btree (level2);
CREATE INDEX if_service_request_ws_wf_protocol_idx ON landing.if_service_request_ws_wf USING btree (protocol);
CREATE INDEX if_service_request_ws_wf_reason_idx ON landing.if_service_request_ws_wf USING btree (reason);
CREATE INDEX if_service_request_ws_wf_row_id_idx ON landing.if_service_request_ws_wf USING btree (row_id, protocol);
CREATE UNIQUE INDEX unique_if_service_request_ws_wf ON landing.if_service_request_ws_wf USING btree (row_id);


-- landing.if_service_request_ws_wf_accessory definition

-- Drop table

-- DROP TABLE landing.if_service_request_ws_wf_accessory;

CREATE TABLE landing.if_service_request_ws_wf_accessory (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	accessory varchar(100) NULL,
	accessoryprice varchar(255) NULL,
	CONSTRAINT if_service_request_ws_wf_accessory_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_service_request_ws_wf_accessory ON landing.if_service_request_ws_wf_accessory USING btree (row_id);


-- landing.if_service_request_ws_wf_part definition

-- Drop table

-- DROP TABLE landing.if_service_request_ws_wf_part;

CREATE TABLE landing.if_service_request_ws_wf_part (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	backorderdate timestamp NULL,
	backorderflg bpchar(1) NULL,
	backordernum varchar(30) NULL,
	backorderstatus varchar(30) NULL,
	partcode varchar(100) NULL,
	partdescription varchar(255) NULL,
	CONSTRAINT if_service_request_ws_wf_part_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_service_request_ws_wf_part ON landing.if_service_request_ws_wf_part USING btree (row_id);


-- landing.if_update_contact_in_wf definition

-- Drop table

-- DROP TABLE landing.if_update_contact_in_wf;

CREATE TABLE landing.if_update_contact_in_wf (
	row_id serial4 NOT NULL,
	contactid varchar NULL,
	created timestamp NOT NULL,
	created_by varchar NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	cnhexpirationdate timestamp NULL,
	suppressallemails bpchar(1) NULL DEFAULT 'N'::bpchar,
	suppressallsms bpchar(1) NULL DEFAULT 'N'::bpchar,
	hmbprintedcard bpchar(1) NULL,
	firstname varchar(50) NULL,
	lastname varchar(50) NULL,
	birthdate timestamp NULL,
	genre varchar(30) NULL,
	hkmeretaildate timestamp NULL,
	homephone varchar(40) NULL,
	workphone varchar(40) NULL,
	cellularphone varchar(40) NULL,
	emailaddress varchar(350) NULL,
	amountfriends int4 NULL,
	amountchildren int4 NULL,
	loyaltyoptinflag bpchar(1) NULL,
	streetaddress varchar(150) NULL,
	addressnumber varchar(100) NULL,
	addresscomplement varchar(100) NULL,
	addresscountry varchar(30) NULL,
	addresscounty varchar(100) NULL,
	addresscity varchar(100) NULL,
	addressstate varchar(50) NULL,
	addresspostalcode varchar(30) NULL,
	suppressallmailings bpchar(1) NULL,
	suppressallcalls bpchar NULL,
	suppressallwhatsapp bpchar(1) NULL,
	suppressallmobile bpchar(1) NULL,
	suppressallvideocall bpchar(1) NULL,
	CONSTRAINT if_update_contact_in_wf_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_update_contact_in_wf ON landing.if_update_contact_in_wf USING btree (row_id);


-- landing.if_update_contact_in_wf_hobby definition

-- Drop table

-- DROP TABLE landing.if_update_contact_in_wf_hobby;

CREATE TABLE landing.if_update_contact_in_wf_hobby (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	hobbydescription varchar(100) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	CONSTRAINT if_update_contact_in_wf_hobby_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_update_contact_in_wf_hobby ON landing.if_update_contact_in_wf_hobby USING btree (row_id);


-- landing.if_update_contact_in_wf_soccerteam definition

-- Drop table

-- DROP TABLE landing.if_update_contact_in_wf_soccerteam;

CREATE TABLE landing.if_update_contact_in_wf_soccerteam (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	soccerteam varchar(100) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	CONSTRAINT if_update_contact_in_wf_soccerteam_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_update_contact_in_wf_soccerteam ON landing.if_update_contact_in_wf_soccerteam USING btree (row_id);


-- landing.if_update_contact_in_wf_socialmedia definition

-- Drop table

-- DROP TABLE landing.if_update_contact_in_wf_socialmedia;

CREATE TABLE landing.if_update_contact_in_wf_socialmedia (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	socialmedianame varchar(100) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	socialmediauser varchar(50) NULL,
	sourcecity varchar(30) NULL,
	CONSTRAINT if_update_contact_in_wf_socialmedia_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_update_contact_in_wf_socialmedia ON landing.if_update_contact_in_wf_socialmedia USING btree (row_id);


-- landing.if_update_contact_in_wf_vehicle definition

-- Drop table

-- DROP TABLE landing.if_update_contact_in_wf_vehicle;

CREATE TABLE landing.if_update_contact_in_wf_vehicle (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	vehicleid varchar(25) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	relationshipstatus varchar(30) NULL DEFAULT 'STANDARD'::character varying,
	hmbrenavamcode varchar(30) NULL,
	currentmileage int4 NULL,
	vehiclelicensenumber varchar(30) NULL,
	CONSTRAINT if_update_contact_in_wf_vehicle_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_update_contact_in_wf_vehicle ON landing.if_update_contact_in_wf_vehicle USING btree (row_id);


-- landing.if_update_lead_ws definition

-- Drop table

-- DROP TABLE landing.if_update_lead_ws;

CREATE TABLE landing.if_update_lead_ws (
	row_id serial4 NOT NULL,
	protocol varchar(64) NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	"result" varchar(100) NULL,
	integrationid varchar(30) NULL,
	salesstatus varchar(100) NULL,
	salecpf varchar(100) NULL,
	status varchar(30) NULL,
	firstinterationdate timestamp NULL,
	salereason varchar(255) NULL,
	enddate timestamp NULL,
	dlrreceivedate timestamp NULL,
	dlrresponsetime varchar NULL,
	pcd bpchar(1) NULL,
	"source" varchar(255) NULL,
	schedvisit timestamp NULL,
	visitdate timestamp NULL,
	visitstat varchar(50) NULL,
	CONSTRAINT if_update_lead_ws_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_update_lead_ws_protocol_idx ON landing.if_update_lead_ws USING btree (protocol);
CREATE UNIQUE INDEX unique_if_update_lead_ws ON landing.if_update_lead_ws USING btree (row_id);


-- landing.if_update_lead_ws_interation definition

-- Drop table

-- DROP TABLE landing.if_update_lead_ws_interation;

CREATE TABLE landing.if_update_lead_ws_interation (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	interactionnum varchar(100) NULL,
	description varchar(1500) NULL,
	"date" timestamp NULL,
	contactcustomer varchar(30) NULL,
	CONSTRAINT if_update_lead_ws_interation_pkey PRIMARY KEY (row_id)
);
CREATE INDEX if_update_lead_ws_interation_interactionnum_idx ON landing.if_update_lead_ws_interation USING btree (interactionnum);
CREATE UNIQUE INDEX unique_if_update_lead_ws_interation ON landing.if_update_lead_ws_interation USING btree (row_id);


-- landing.if_update_lead_ws_temperature definition

-- Drop table

-- DROP TABLE landing.if_update_lead_ws_temperature;

CREATE TABLE landing.if_update_lead_ws_temperature (
	row_id serial4 NOT NULL,
	par_row_id int4 NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	proc_result_yn bpchar(1) NULL,
	proc_result_msg varchar(255) NULL,
	temperaturenum varchar(100) NULL,
	temperature varchar(300) NULL,
	CONSTRAINT if_update_lead_ws_temperature_pkey PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_if_update_lead_ws_temperature ON landing.if_update_lead_ws_temperature USING btree (row_id);


-- landing.loyalty_retention definition

-- Drop table

-- DROP TABLE landing.loyalty_retention;

CREATE TABLE landing.loyalty_retention (
	row_id varchar(30) NULL DEFAULT nextval('process.seq_massive_public'::regclass)::text,
	par_row_id varchar(30) NULL,
	chassi varchar(30) NULL,
	delaer_code varchar(30) NULL,
	dealer_nickname varchar(30) NULL,
	dealer_grupo varchar(30) NULL,
	dealer_regiao varchar(30) NULL,
	dealer_cidade varchar(30) NULL,
	dt_ultima_venda varchar(30) NULL,
	id_contato_siebel varchar(30) NULL,
	marca varchar(30) NULL,
	modelo varchar(30) NULL,
	concessionario varchar(30) NULL,
	cliente_recompra varchar(30) NULL
);


-- landing.massive_campaign definition

-- Drop table

-- DROP TABLE landing.massive_campaign;

CREATE TABLE landing.massive_campaign (
	row_id varchar(30) NOT NULL DEFAULT nextval('process.seq_massive_public'::regclass)::text,
	title varchar(295) NULL,
	created date NOT NULL,
	created_by varchar(15) NULL,
	last_upd date NOT NULL,
	last_upd_by varchar(15) NULL,
	CONSTRAINT massive_campaign_pk PRIMARY KEY (row_id)
);


-- landing.novo_de_novo definition

-- Drop table

-- DROP TABLE landing.novo_de_novo;

CREATE TABLE landing.novo_de_novo (
	row_id varchar(30) NULL DEFAULT nextval('process.seq_massive_public'::regclass)::text,
	par_row_id varchar(30) NULL,
	campaign varchar(30) NULL,
	oferta varchar(30) NULL,
	cpf_cnpj varchar(30) NULL,
	nome varchar(30) NULL,
	email varchar(295) NULL,
	telefone varchar(30) NULL,
	veiculo varchar(30) NULL,
	modelo varchar(295) NULL,
	entrada varchar(30) NULL,
	parcela varchar(30) NULL,
	ocn varchar(30) NULL
);


-- landing.s_activity_att definition

-- Drop table

-- DROP TABLE landing.s_activity_att;

CREATE TABLE landing.s_activity_att (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT now(),
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT now(),
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	file_auto_upd_flg bpchar(1) NOT NULL,
	file_defer_flg bpchar(1) NOT NULL,
	file_dock_req_flg bpchar(1) NOT NULL,
	file_dock_stat_flg bpchar(1) NOT NULL,
	file_name varchar(200) NOT NULL,
	db_last_upd timestamp NULL,
	file_date timestamp NULL,
	file_size numeric(10) NULL,
	"comments" varchar(250) NULL,
	db_last_upd_src varchar(50) NULL,
	file_ext varchar(10) NULL,
	file_rev_num varchar(15) NULL,
	file_src_path varchar(255) NULL,
	file_src_type varchar(30) NULL,
	mail_att_type_cd varchar(30) NULL
);


-- landing.s_asset definition

-- Drop table

-- DROP TABLE landing.s_asset;

CREATE TABLE landing.s_asset (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	asset_num varchar(100) NULL,
	auto_sr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	comp_und_wrnty_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	customizable_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	dmndng_dr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	fleet_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	hh_consumed_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	prod_und_wrnty_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	referenceable_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	srl_num_vrfd_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	test_asset_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	und_mfg_wrnty_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	billpay_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	alt_fuel_flg bpchar(1) NULL,
	annual_revn int4 NULL,
	annual_usg int4 NULL,
	apr int4 NULL,
	apy int4 NULL,
	archive_flg bpchar(1) NULL,
	asgn_dt timestamp NULL,
	asgn_usr_excld_flg bpchar(1) NULL,
	asset_value_amt int4 NULL,
	asset_val_exch_dt timestamp NULL,
	avail_bal int4 NULL,
	average_bal int4 NULL,
	capacity int4 NULL,
	caution_flg bpchar(1) NULL,
	cfg_valdn_stat_dt timestamp NULL,
	current_bal int4 NULL,
	cutoff_flg bpchar(1) NULL,
	db_last_upd timestamp NULL,
	dlr_inv_price int4 NULL,
	efficiency_rating int4 NULL,
	end_dt timestamp NULL,
	exchg_dt timestamp NULL,
	exch_date timestamp NULL,
	extd_qty int4 NULL,
	extended_qty int4 NULL,
	inception_dt timestamp NULL,
	install_dt timestamp NULL,
	internal_asset_flg bpchar(1) NULL,
	intr_rate int4 NULL,
	last_download_dt timestamp NULL,
	last_test_dt timestamp NULL,
	lcns_exp_dt timestamp NULL,
	load_added int4 NULL,
	meter_cnt int4 NULL,
	mfgd_dt timestamp NULL,
	model_yr int4 NULL,
	msrp int4 NULL,
	original_cost int4 NULL,
	premium int4 NULL,
	premium_dt timestamp NULL,
	profit int4 NULL,
	pr_rep_dnrm_flg bpchar(1) NULL,
	pr_rep_manl_flg bpchar(1) NULL,
	pr_rep_sys_flg bpchar(1) NULL,
	purch_adj_unit_pri int4 NULL,
	purch_dt timestamp NULL,
	purch_lst_unit_pri int4 NULL,
	qty int4 NULL,
	recovered_dt timestamp NULL,
	registered_dt timestamp NULL,
	rel_limit int4 NULL,
	revenue int4 NULL,
	rplcmnt_val_amt int4 NULL,
	ship_dt timestamp NULL,
	start_dt timestamp NULL,
	status_chg_dt timestamp NULL,
	svc_per_prod_amt int4 NULL,
	uninstall_dt timestamp NULL,
	warranty_end_dt timestamp NULL,
	warranty_start_dt timestamp NULL,
	wrnty_last_upd_dt timestamp NULL,
	aagsvc_con_id varchar(15) NULL,
	aia_integ_id varchar(150) NULL,
	alias_name varchar(100) NULL,
	assembly_port_id varchar(15) NULL,
	asset_cond_cd varchar(30) NULL,
	asset_img_id varchar(15) NULL,
	asset_val_curcy_cd varchar(20) NULL,
	bar_code_num varchar(30) NULL,
	base_currency_cd varchar(30) NULL,
	billacct_id varchar(15) NULL,
	bill_accnt_id varchar(15) NULL,
	bill_profile_id varchar(15) NULL,
	bill_status_cd varchar(30) NULL,
	bl_addr_id varchar(15) NULL,
	body_style_cd varchar(30) NULL,
	branch_id varchar(15) NULL,
	build varchar(30) NULL,
	capitalized_cd varchar(30) NULL,
	case_id varchar(15) NULL,
	cfg1_integ_id varchar(40) NULL,
	cfg2_integ_id varchar(40) NULL,
	cfg3_integ_id varchar(40) NULL,
	cfg_state_cd varchar(30) NULL,
	cfg_type_cd varchar(30) NULL,
	cfg_valdn_stat_cd varchar(30) NULL,
	channel_type_cd varchar(30) NULL,
	"comments" varchar(255) NULL,
	company_cd varchar(30) NULL,
	condition_cd varchar(30) NULL,
	cost_lst_id varchar(15) NULL,
	curcy_cd varchar(20) NULL,
	cur_agree_id varchar(15) NULL,
	data_src varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	desc_text varchar(255) NULL,
	dlr_id varchar(15) NULL,
	doors_type_cd varchar(30) NULL,
	drive_train_cd varchar(30) NULL,
	engine_type_cd varchar(30) NULL,
	extension_cd varchar(30) NULL,
	ext_color_cd varchar(30) NULL,
	fleet_ou_id varchar(15) NULL,
	flt_type_cd varchar(30) NULL,
	fuel_cd varchar(30) NULL,
	hlthaccnt_type_cd varchar(30) NULL,
	insclm_evt_id varchar(15) NULL,
	integration_id varchar(30) NULL,
	int_color_cd varchar(30) NULL,
	invloc_id varchar(15) NULL,
	lcns_num varchar(30) NULL,
	lcns_state_cd varchar(10) NULL,
	load_period_cd varchar(30) NULL,
	lob_cd varchar(30) NULL,
	lot_num varchar(100) NULL,
	make_cd varchar(30) NULL,
	meter_loc varchar(50) NULL,
	meter_type_cd varchar(30) NULL,
	meter_use_cd varchar(30) NULL,
	model_cd varchar(30) NULL,
	"name" varchar(100) NULL,
	new_usd_cd varchar(30) NULL,
	oper_status_cd varchar(30) NULL,
	org_census_id varchar(15) NULL,
	orig_order_id varchar(15) NULL,
	ou_addr_id varchar(15) NULL,
	ownership_type_cd varchar(30) NULL,
	owner_accnt_id varchar(15) NULL,
	owner_asset_num varchar(50) NULL,
	owner_con_id varchar(15) NULL,
	ownr_type_cd varchar(30) NULL,
	partner_bank varchar(50) NULL,
	partner_branch varchar(50) NULL,
	par_asset_id varchar(15) NULL,
	per_addr_id varchar(15) NULL,
	pnsn_subtype_cd varchar(30) NULL,
	policy_source_id varchar(15) NULL,
	port_valid_prod_id varchar(15) NULL,
	pref_srv_dlr_id varchar(15) NULL,
	pri_desc_text varchar(250) NULL,
	pri_lst_id varchar(15) NULL,
	producer_cd varchar(30) NULL,
	prod_id varchar(15) NULL,
	prod_inv_id varchar(15) NULL,
	promotion_id varchar(15) NULL,
	prom_integ_id varchar(30) NULL,
	prom_item_id varchar(15) NULL,
	prom_src_intg_id varchar(30) NULL,
	prop_loss_type_cd varchar(30) NULL,
	prop_type_cd varchar(30) NULL,
	pr_accnt_id varchar(15) NULL,
	pr_asset_id varchar(15) NULL,
	pr_asset_wrnty_id varchar(15) NULL,
	pr_con_id varchar(15) NULL,
	pr_discnt_id varchar(15) NULL,
	pr_drvr_id varchar(15) NULL,
	pr_emp_id varchar(15) NULL,
	pr_fin_dtl_id varchar(15) NULL,
	pr_grp_ou_id varchar(15) NULL,
	pr_postn_id varchar(15) NULL,
	pr_terr_id varchar(15) NULL,
	purch_loc_desc varchar(100) NULL,
	rate_cd varchar(30) NULL,
	rate_exception varchar(30) NULL,
	rate_plan_cd varchar(30) NULL,
	rate_state varchar(30) NULL,
	reason_cd varchar(30) NULL,
	referral_name varchar(100) NULL,
	ref_number_1 varchar(30) NULL,
	ref_number_2 varchar(30) NULL,
	ref_number_3 varchar(30) NULL,
	region varchar(50) NULL,
	rel_type_cd varchar(30) NULL,
	rev_num varchar(30) NULL,
	root_asset_id varchar(15) NULL,
	rtng_dlr_id varchar(15) NULL,
	serial_num varchar(100) NULL,
	service_point_id varchar(15) NULL,
	serv_acct_id varchar(15) NULL,
	sp_num varchar(250) NULL,
	srv_regn_id varchar(15) NULL,
	sr_rtng_cd varchar(30) NULL,
	status_cd varchar(30) NULL,
	stat_reason_cd varchar(30) NULL,
	stock_num varchar(30) NULL,
	sub_status_cd varchar(30) NULL,
	sub_type_cd varchar(30) NULL,
	supplier_ou_id varchar(15) NULL,
	susp_drug_type_cd varchar(30) NULL,
	term_cd varchar(30) NULL,
	thmbnl_image_id varchar(15) NULL,
	tier_pri_info varchar(250) NULL,
	timeframe_cd varchar(30) NULL,
	tradein_type_cd varchar(30) NULL,
	transmission_cd varchar(30) NULL,
	trim_cd varchar(30) NULL,
	type_cd varchar(30) NULL,
	uom_cd varchar(30) NULL,
	usg_uom_cd varchar(30) NULL,
	value_basis_cd varchar(30) NULL,
	"version" varchar(30) NULL,
	warranty_type_cd varchar(30) NULL,
	xa_class_id varchar(15) NULL,
	x_ext_myh_dt timestamp NULL,
	x_ext_myh_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	x_sbsdry_chnnl varchar(50) NULL,
	dlr_con_int_id varchar(30) NULL,
	x_sales_id varchar(15) NULL,
	x_sanitized_flg bpchar(1) NULL,
	agree_item_id varchar(15) NULL,
	aia_integ1_id varchar(500) NULL,
	applnt_grp_id varchar(15) NULL,
	asset_mem_integ_id varchar(30) NULL,
	discnt_amt int4 NULL,
	discnt_percent int4 NULL,
	dyn_discnt_meth_cd varchar(30) NULL,
	img_src_path varchar(500) NULL,
	pg_integ_id varchar(30) NULL,
	policy_discnt_amt int4 NULL,
	pri_commit_type_cd varchar(30) NULL,
	prom_group_id varchar(15) NULL,
	prom_group_item_id varchar(15) NULL,
	spl_rate_lst_id varchar(15) NULL,
	thmbnl_imgsrc_path varchar(500) NULL,
	x_svc_conducted bpchar(1) NULL,
	x_sales_cancel_dt timestamp NULL
);
CREATE INDEX s_asset_serial_num_idx ON landing.s_asset USING btree (serial_num);
CREATE UNIQUE INDEX unique_s_asset ON landing.s_asset USING btree (row_id);


-- landing.s_asset_accnt definition

-- Drop table

-- DROP TABLE landing.s_asset_accnt;

CREATE TABLE landing.s_asset_accnt (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	accnt_id varchar(15) NOT NULL,
	asset_id varchar(15) NOT NULL,
	db_last_upd timestamp NULL,
	guarantor_flg bpchar(1) NULL,
	payor_flg bpchar(1) NULL,
	percentage int4 NULL,
	revoc_flg bpchar(1) NULL,
	benef_cd varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	owner_cd varchar(30) NULL,
	rel_type_cd varchar(30) NULL,
	role_cd varchar(30) NULL,
	status_cd varchar(30) NULL,
	x_employee_flg bpchar(1) NULL DEFAULT 'N'::bpchar
);
CREATE INDEX s_asset_accnt_asset_id_idx ON landing.s_asset_accnt USING btree (asset_id);
CREATE UNIQUE INDEX unique_s_asset_accnt ON landing.s_asset_accnt USING btree (row_id);


-- landing.s_asset_atx definition

-- Drop table

-- DROP TABLE landing.s_asset_atx;

CREATE TABLE landing.s_asset_atx (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	oem_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	extnd_wrnty_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	anl_mls_alwd int4 NULL,
	avg_anl_mlg int4 NULL,
	bol_dt_1 timestamp NULL,
	bol_dt_2 timestamp NULL,
	bol_dt_3 timestamp NULL,
	build_dt timestamp NULL,
	cf_eval_amt int4 NULL,
	cf_eval_dt timestamp NULL,
	db_last_upd timestamp NULL,
	dealer_rcpt_dt timestamp NULL,
	down_pymt int4 NULL,
	extnd_wrnty_end_dt timestamp NULL,
	extnd_wrnty_st_dt timestamp NULL,
	first_sale_dt timestamp NULL,
	int_rate int4 NULL,
	last_insp_dt timestamp NULL,
	last_srvc_dt timestamp NULL,
	lease_tr_dt timestamp NULL,
	loan_term int4 NULL,
	mthly_pymt int4 NULL,
	next_srvc_due_dt timestamp NULL,
	odomtr_rcpt int4 NULL,
	odomtr_rdng int4 NULL,
	odomtr_rdng_dt timestamp NULL,
	odomtr_sale numeric(22, 1) NULL,
	prchs_price int4 NULL,
	residual_val int4 NULL,
	sales_ordr_dt timestamp NULL,
	sales_tax int4 NULL,
	bol_num_1 varchar(30) NULL,
	bol_num_2 varchar(30) NULL,
	bol_num_3 varchar(30) NULL,
	build_ordr_num varchar(30) NULL,
	build_plant_cd varchar(30) NULL,
	cf_eval_svc_cd varchar(30) NULL,
	cntry_of_orgn_cd varchar(30) NULL,
	config_cd varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	extnd_plan_type varchar(50) NULL,
	last_srvc_cd varchar(30) NULL,
	location_cd varchar(30) NULL,
	next_srvc_cd varchar(30) NULL,
	odomtr_uom_cd varchar(30) NULL,
	prchs_type_cd varchar(30) NULL,
	pr_use_cd varchar(30) NULL,
	regulatory_cert_cd varchar(30) NULL,
	sales_ordr_num varchar(30) NULL,
	sold_by_cd varchar(30) NULL,
	x_manufacture_year varchar(30) NULL,
	x_renavam_code varchar(30) NULL,
	x_fuel varchar(1) NULL,
	damage_value_amt int4 NULL,
	eval_auctn_pri_amt int4 NULL,
	x_unique_offer bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	x_grp_unique_offer bpchar(1) NOT NULL DEFAULT 'N'::bpchar
);
CREATE INDEX s_asset_atx_par_row_id_idx ON landing.s_asset_atx USING btree (par_row_id);
CREATE UNIQUE INDEX unique_s_asset_atx ON landing.s_asset_atx USING btree (row_id);


-- landing.s_asset_complete definition

-- Drop table

-- DROP TABLE landing.s_asset_complete;

CREATE TABLE landing.s_asset_complete (
	row_id varchar(15) NOT NULL,
	work_dt timestamp NULL,
	work_num int4 NULL,
	CONSTRAINT s_asset_complete_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_s_asset_complete ON landing.s_asset_complete USING btree (row_id);


-- landing.s_asset_con definition

-- Drop table

-- DROP TABLE landing.s_asset_con;

CREATE TABLE landing.s_asset_con (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	asset_id varchar(15) NOT NULL,
	contact_id varchar(15) NOT NULL,
	relation_type_cd varchar(30) NOT NULL DEFAULT 'STANDARD'::character varying,
	billpay_enbl_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 int4 NULL,
	attrib_15 int4 NULL,
	attrib_16 int4 NULL,
	attrib_17 int4 NULL,
	attrib_18 int4 NULL,
	attrib_19 int4 NULL,
	attrib_20 int4 NULL,
	attrib_21 int4 NULL,
	attrib_22 int4 NULL,
	attrib_23 int4 NULL,
	attrib_24 int4 NULL,
	attrib_25 int4 NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	attrib_48 bpchar(1) NULL,
	attrib_49 bpchar(1) NULL,
	attrib_50 bpchar(1) NULL,
	cert_fin_resp_flg bpchar(1) NULL,
	db_last_upd timestamp NULL,
	effective_dt timestamp NULL,
	end_dt timestamp NULL,
	exclude_flg bpchar(1) NULL,
	guarantor_flg bpchar(1) NULL,
	named_ins_flg bpchar(1) NULL,
	payor_flg bpchar(1) NULL,
	percentage int4 NULL,
	pn_cntrb_amt int4 NULL,
	pn_cntrb_pct int4 NULL,
	pn_cntrb_st_dt timestamp NULL,
	prior_yr_clm_num int4 NULL,
	rating_dt timestamp NULL,
	received_dt timestamp NULL,
	revoc_flg bpchar(1) NULL,
	addr_per_id varchar(15) NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(250) NULL,
	benef_cd varchar(30) NULL,
	"comments" varchar(250) NULL,
	db_last_upd_src varchar(50) NULL,
	driver_cd varchar(30) NULL,
	emp_appr_cd varchar(30) NULL,
	enrolmnt_type_cd varchar(30) NULL,
	grp_class_id varchar(15) NULL,
	member_num varchar(30) NULL,
	named_ins_cd varchar(30) NULL,
	owner_cd varchar(30) NULL,
	pr_discnt_id varchar(15) NULL,
	status_cd varchar(30) NULL,
	x_employee_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	src_asset_id varchar(15) NULL
);
CREATE INDEX s_asset_con_asset_id_idx ON landing.s_asset_con USING btree (asset_id);
CREATE UNIQUE INDEX unique_s_asset_con ON landing.s_asset_con USING btree (row_id);


-- landing.s_asset_x definition

-- Drop table

-- DROP TABLE landing.s_asset_x;

CREATE TABLE landing.s_asset_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 int4 NULL,
	attrib_15 int4 NULL,
	attrib_16 int4 NULL,
	attrib_17 int4 NULL,
	attrib_18 int4 NULL,
	attrib_19 int4 NULL,
	attrib_20 int4 NULL,
	attrib_21 int4 NULL,
	attrib_22 int4 NULL,
	attrib_23 int4 NULL,
	attrib_24 int4 NULL,
	attrib_25 int4 NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	db_last_upd_src varchar(50) NULL,
	x_del_home bpchar(1) NULL,
	x_dig_sales bpchar(1) NULL,
	x_td_home bpchar(1) NULL,
	x_vin_receive_dt timestamp NULL
);
CREATE INDEX s_asset_x_par_row_id_idx ON landing.s_asset_x USING btree (par_row_id);
CREATE UNIQUE INDEX unique_s_asset_x ON landing.s_asset_x USING btree (row_id);


-- landing.s_asset_xm definition

-- Drop table

-- DROP TABLE landing.s_asset_xm;

CREATE TABLE landing.s_asset_xm (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT CURRENT_DATE,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT CURRENT_DATE,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 numeric(22, 7) NULL,
	attrib_15 numeric(22, 7) NULL,
	attrib_16 numeric(22, 7) NULL,
	attrib_17 numeric(22, 7) NULL,
	attrib_18 numeric(22, 7) NULL,
	attrib_19 numeric(22, 7) NULL,
	attrib_20 numeric(22, 7) NULL,
	attrib_21 numeric(22, 7) NULL,
	attrib_22 numeric(22, 7) NULL,
	attrib_23 numeric(22, 7) NULL,
	attrib_24 numeric(22, 7) NULL,
	attrib_25 numeric(22, 7) NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	db_last_upd_src varchar(50) NULL
);


-- landing.s_audit_item definition

-- Drop table

-- DROP TABLE landing.s_audit_item;

CREATE TABLE landing.s_audit_item (
	item_iden_num numeric(15) NOT NULL DEFAULT 0,
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT CURRENT_DATE,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT CURRENT_DATE,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	buscomp_name varchar(75) NOT NULL,
	operation_cd varchar(30) NOT NULL,
	record_id varchar(15) NOT NULL,
	user_id varchar(15) NOT NULL,
	audit_log text NULL,
	db_last_upd timestamp NULL,
	operation_dt timestamp NULL,
	sync_dt timestamp NULL,
	audit_source_cd varchar(50) NULL,
	bc_base_tbl varchar(30) NULL,
	child_bc_base_tbl varchar(30) NULL,
	child_bc_name varchar(75) NULL,
	child_record_id varchar(15) NULL,
	db_last_upd_src varchar(50) NULL,
	field_name varchar(75) NULL,
	group_num varchar(15) NULL,
	link_name varchar(175) NULL,
	new_val varchar(2000) NULL,
	node_name varchar(50) NULL,
	old_val varchar(2000) NULL,
	src_dest_id varchar(15) NULL,
	tbl_name varchar(30) NULL,
	tbl_record_id varchar(15) NULL
);


-- landing.s_call_lst definition

-- Drop table

-- DROP TABLE landing.s_call_lst;

CREATE TABLE landing.s_call_lst (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	call_lst_num varchar(30) NOT NULL DEFAULT 'x'::character varying,
	con_genrtd_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	incl_accntcon_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	incl_accnt_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	incl_con_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	incl_emp_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	incl_postn_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	incl_prsp_con_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	"name" varchar(200) NOT NULL,
	rte_contacts_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	rte_prsp_cons_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	file_defer_flg bpchar(1) NULL DEFAULT 'R'::bpchar,
	clean_file_flg bpchar(1) NULL,
	db_last_upd timestamp NULL,
	dedup_file_flg bpchar(1) NULL,
	desired_num_cons int4 NULL,
	desired_pct_of_seg int4 NULL,
	expiration_dt timestamp NULL,
	file_auto_upd_flg bpchar(1) NULL,
	file_date timestamp NULL,
	file_dock_req_flg bpchar(1) NULL,
	file_dock_stat_flg bpchar(1) NULL,
	file_size int4 NULL,
	last_cnts_upd_dt timestamp NULL,
	num_cons_upd_dt timestamp NULL,
	num_contacts int4 NULL,
	num_created_cmpcon int4 NULL,
	num_created_prsp int4 NULL,
	num_created_rspns int4 NULL,
	num_errors int4 NULL,
	num_incoming_prsp int4 NULL,
	priority_num int4 NULL,
	private_flg bpchar(1) NULL,
	purch_amt int4 NULL,
	purch_dt timestamp NULL,
	access_lvl_cd varchar(30) NULL,
	assign_to_type_cd varchar(30) NULL,
	cap_type_cd varchar(30) NULL,
	chart_aggr_spec varchar(250) NULL,
	chart_search_spec varchar(2000) NULL,
	codepage_cd varchar(30) NULL,
	col_map_tmpl_id varchar(15) NULL,
	col_separator varchar(1) NULL,
	db_last_upd_src varchar(50) NULL,
	dedup_type_cd varchar(30) NULL,
	desc_text varchar(255) NULL,
	file_ext varchar(10) NULL,
	file_name varchar(200) NULL,
	file_rev_num varchar(15) NULL,
	file_src_path varchar(250) NULL,
	file_src_type varchar(30) NULL,
	folder_path varchar(250) NULL,
	import_status_cd varchar(30) NULL,
	indust_id varchar(15) NULL,
	list_type_cd varchar(30) NULL,
	log_file_path varchar(250) NULL,
	match_type_cd varchar(30) NULL,
	max_ncons_sort_fld varchar(75) NULL,
	max_num_accnt_cons varchar(30) NULL,
	message_text varchar(2000) NULL,
	node_indent varchar(200) NULL,
	obj_name varchar(75) NULL,
	par_call_lst_id varchar(15) NULL,
	predict_model_name varchar(50) NULL,
	pr_count_qry_id varchar(15) NULL,
	pr_postn_id varchar(15) NULL,
	pr_prod_id varchar(15) NULL,
	pr_srch_qry_id varchar(15) NULL,
	pr_src_id varchar(15) NULL,
	purch_curcy_cd varchar(20) NULL,
	region_cd varchar(30) NULL,
	region_id varchar(15) NULL,
	saw_server_id varchar(15) NULL,
	seg_type_cd varchar(30) NULL,
	smplng_sort_by_fld varchar(75) NULL,
	smplng_type_cd varchar(30) NULL,
	src_ou_id varchar(15) NULL,
	srtfam_id varchar(15) NULL,
	srtfam_lvl_id varchar(15) NULL,
	status_cd varchar(30) NULL,
	subtype_cd varchar(30) NULL,
	tmp_calc_text varchar(250) NULL,
	trgt_grp_id varchar(15) NULL,
	trgt_grp_name varchar(100) NULL,
	ultpar_call_lst_id varchar(15) NULL,
	x_use_num int4 NULL,
	x_use_once_flg bpchar(1) NULL,
	cpr_org_name varchar(100) NULL,
	cpr_prod_name varchar(100) NULL,
	cpr_treatment_chnl varchar(100) NULL,
	CONSTRAINT s_call_lst_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_s_call_lst ON landing.s_call_lst USING btree (row_id);


-- landing.s_camp_con definition

-- Drop table

-- DROP TABLE landing.s_camp_con;

CREATE TABLE landing.s_camp_con (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num numeric(22, 7) NOT NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	asgn_usr_excld_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	ctrl_grp_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	load_num int4 NOT NULL DEFAULT 0,
	mark_for_del_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	pr_rep_dnrm_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	pr_rep_manl_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	pr_rep_sys_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	src_id varchar(15) NOT NULL,
	target_num numeric(22, 7) NOT NULL DEFAULT 1,
	con_fst_name varchar(50) NULL DEFAULT 'x'::character varying,
	con_last_name varchar(50) NULL DEFAULT 'x'::character varying,
	actl_revn int4 NULL,
	actl_revn_dt timestamp NULL,
	asgn_dt timestamp NULL,
	batch_num int4 NULL,
	call_completed bpchar(1) NULL,
	camp_con_score int4 NULL,
	completed_dt timestamp NULL,
	contacted_dt timestamp NULL,
	db_last_upd timestamp NULL,
	ext_score int4 NULL,
	msg_open_ts timestamp NULL,
	num_dial_attempts int4 NULL,
	tgtrev_exch_dt timestamp NULL,
	tgt_revn int4 NULL,
	actl_revn_curcy_cd varchar(20) NULL,
	camp_con_num varchar(75) NULL,
	camp_ld_wave_id varchar(15) NULL,
	camp_wave_id varchar(15) NULL,
	"comments" varchar(250) NULL,
	con_mid_name varchar(50) NULL,
	con_per_id varchar(15) NULL,
	con_pr_dept_ou_id varchar(15) NULL,
	db_last_upd_src varchar(50) NULL,
	dcp_id varchar(15) NULL,
	dd_user_key_id varchar(15) NULL,
	fn_accnt_id varchar(15) NULL,
	insert_cd varchar(30) NULL,
	key_01 varchar(30) NULL,
	key_02 varchar(30) NULL,
	key_03 varchar(30) NULL,
	key_04 varchar(30) NULL,
	key_05 varchar(30) NULL,
	key_06 varchar(30) NULL,
	key_07 varchar(30) NULL,
	lst_distr_id varchar(15) NULL,
	msg_bncd_reason_cd varchar(30) NULL,
	msg_bncd_stat_cd varchar(30) NULL,
	msg_dlvry_stat_cd varchar(30) NULL,
	opty_id varchar(15) NULL,
	orggrp_id varchar(15) NULL,
	outcome_cd varchar(30) NULL,
	owner_per_id varchar(15) NULL,
	pgroup_id varchar(15) NULL,
	postn_id varchar(15) NULL,
	prsp_con_per_id varchar(15) NULL,
	pr_call_lst_id varchar(15) NULL,
	pr_comm_id varchar(15) NULL,
	referredby_prsp_id varchar(15) NULL,
	referred_by_con_id varchar(15) NULL,
	segment_code_1 varchar(30) NULL,
	segment_code_2 varchar(30) NULL,
	src_evt_reg_id varchar(15) NULL,
	stat_cd varchar(30) NULL,
	tgtrev_curcy_cd varchar(20) NULL,
	x_addr1 varchar(500) NULL,
	x_addr2 varchar(500) NULL,
	x_addr3 varchar(500) NULL,
	x_callback_dt timestamp NULL,
	x_camp_join_flg bpchar(1) NULL,
	x_cell_phone varchar(40) NULL,
	x_dedup_cd varchar(30) NULL,
	x_dedup_flg bpchar(1) NULL,
	x_dp_int_dt timestamp NULL,
	x_dp_int_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	x_ea varchar(80) NULL,
	x_goneaway_flg varchar(1) NULL,
	x_hkme_sales_conid varchar(15) NULL,
	x_home_phone varchar(40) NULL,
	x_household_id varchar(15) NULL,
	x_origin varchar(30) NULL,
	x_send_tdr_email_dt timestamp NULL,
	x_send_tdr_email_flg bpchar(1) NULL,
	x_sms_count int4 NULL,
	x_suppression_cd varchar(100) NULL,
	x_suppression_flg bpchar(1) NULL,
	x_vin varchar(100) NULL,
	x_web_ems_field varchar(1000) NULL,
	x_sms_fail_reason varchar(50) NULL,
	CONSTRAINT s_camp_con_pk PRIMARY KEY (row_id)
);
CREATE INDEX unique_s_camp_con ON landing.s_camp_con USING btree (row_id);


-- landing.s_camp_ld_wave definition

-- Drop table

-- DROP TABLE landing.s_camp_ld_wave;

CREATE TABLE landing.s_camp_ld_wave (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	camp_id varchar(15) NOT NULL,
	load_num numeric(10) NOT NULL,
	wave_num numeric(10) NOT NULL,
	alloc_pct numeric(22, 7) NULL,
	db_last_upd timestamp NULL,
	dt_lag numeric(10) NULL,
	exported_ts timestamp NULL,
	launched_ts timestamp NULL,
	loaded_ts timestamp NULL,
	num_loaded_cons numeric(10) NULL,
	scheduled_ts timestamp NULL,
	db_last_upd_src varchar(50) NULL,
	dt_lag_units_cd varchar(30) NULL,
	exec_status_cd varchar(30) NULL,
	exec_stat_desc varchar(250) NULL,
	pr_dcp_id varchar(15) NULL,
	wave_setting_num varchar(10) NULL,
	x_ds_cons numeric(10) NULL,
	x_ds_flag bpchar(1) NULL
);


-- landing.s_comm_dtl definition

-- Drop table

-- DROP TABLE landing.s_comm_dtl;

CREATE TABLE landing.s_comm_dtl (
	row_id varchar(15) NOT NULL,
	created timestamp NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	db_last_upd timestamp NULL,
	banner_ad_strng varchar(100) NULL,
	client_ip_addr varchar(100) NULL,
	current_url varchar(200) NULL,
	db_last_upd_src varchar(50) NULL,
	hyperlink_name varchar(100) NULL,
	keyword_strng varchar(100) NULL,
	mkt_srvy_lang_id varchar(5) NULL,
	referrer_url varchar(200) NULL,
	referrer_username varchar(100) NULL,
	response_url varchar(250) NULL,
	rply_dlvry_mthd_cd varchar(30) NULL,
	rply_email_addr varchar(350) NULL,
	rply_fax_ph_num varchar(40) NULL,
	rply_mail_addr varchar(200) NULL,
	rply_mail_city varchar(50) NULL,
	rply_mail_country varchar(30) NULL,
	rply_mail_county varchar(50) NULL,
	rply_mail_province varchar(50) NULL,
	rply_mail_state varchar(10) NULL,
	rply_mail_zipcode varchar(30) NULL,
	rply_ph_num varchar(40) NULL,
	rply_priority_cd varchar(30) NULL,
	rply_time_cd varchar(30) NULL,
	subscr_drct_ml_cd varchar(30) NULL,
	subscr_email_cd varchar(30) NULL,
	subscr_fax_cd varchar(30) NULL,
	subscr_phone_cd varchar(30) NULL
);


-- landing.s_communication definition

-- Drop table

-- DROP TABLE landing.s_communication;

CREATE TABLE landing.s_communication (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT CURRENT_DATE,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT CURRENT_DATE,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	comm_date timestamp NOT NULL,
	comm_uid varchar(30) NOT NULL DEFAULT 'x'::character varying,
	resp_type_cd varchar(30) NOT NULL DEFAULT 'Unclassified response'::character varying,
	pgroup_public_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	asgn_dt timestamp NULL,
	asgn_usr_excld_flg bpchar(1) NULL,
	call_duration numeric(22, 7) NULL,
	cost_amt numeric(22, 7) NULL,
	cs_score numeric(10) NULL,
	db_last_upd timestamp NULL,
	inbound_flg bpchar(1) NULL,
	load_num numeric(10) NULL,
	ofcr_dir_flg bpchar(1) NULL,
	priv_flg bpchar(1) NULL,
	prod_msg_postn_num numeric(10) NULL,
	prod_msg_score numeric(10) NULL,
	pr_rep_dnrm_flg bpchar(1) NULL,
	pr_rep_manl_flg bpchar(1) NULL,
	pr_rep_sys_flg bpchar(1) NULL,
	supp_notif_flg bpchar(1) NULL,
	urgent_flg bpchar(1) NULL,
	accnt_id varchar(15) NULL,
	activity_id varchar(15) NULL,
	ani varchar(40) NULL,
	call_lst_id varchar(15) NULL,
	camp_con_id varchar(15) NULL,
	camp_con_num varchar(75) NULL,
	camp_media_id varchar(15) NULL,
	comm_method varchar(30) NULL,
	con_type_cd varchar(30) NULL,
	cost_curcy_cd varchar(20) NULL,
	cs_path_id varchar(15) NULL,
	cs_run_id varchar(15) NULL,
	db_last_upd_src varchar(50) NULL,
	dcp_id varchar(15) NULL,
	desc_text varchar(250) NULL,
	disposition_cd varchar(30) NULL,
	doc_type_cd varchar(30) NULL,
	downld_lit_id varchar(15) NULL,
	equiv_act_id varchar(15) NULL,
	evt_reg_id varchar(15) NULL,
	lead_id varchar(15) NULL,
	meet_loc varchar(50) NULL,
	mkt_srvy_id varchar(15) NULL,
	nosale_res_cd varchar(30) NULL,
	offer_num varchar(30) NULL,
	order_id varchar(15) NULL,
	outcome_cd varchar(30) NULL,
	par_comm_id varchar(15) NULL,
	prod_id varchar(15) NULL,
	prod_msg_id varchar(15) NULL,
	prod_msg_lang_id varchar(5) NULL,
	prod_msg_src_id varchar(15) NULL,
	prod_msg_title varchar(100) NULL,
	prsp_con_id varchar(15) NULL,
	pr_con_id varchar(15) NULL,
	pr_emp_id varchar(15) NULL,
	pr_opty_id varchar(15) NULL,
	pr_postn_id varchar(15) NULL,
	pr_prtnr_id varchar(15) NULL,
	pr_ptcpt_emp_id varchar(15) NULL,
	pr_terr_id varchar(15) NULL,
	reason_cd varchar(30) NULL,
	reject_comment varchar(250) NULL,
	reject_reason_cd varchar(30) NULL,
	rel_prod_id varchar(15) NULL,
	resp_value_cd varchar(30) NULL,
	src_evt_id varchar(15) NULL,
	src_id varchar(15) NULL,
	status_cd varchar(30) NULL,
	subject_text varchar(250) NULL,
	suppress_doc_id varchar(15) NULL,
	suppress_party_id varchar(15) NULL,
	supprs_doc_item_id varchar(15) NULL,
	"text" varchar NULL,
	x_call_end_time timestamp NULL,
	x_call_id varchar(50) NULL,
	x_call_start_time timestamp NULL,
	x_subsch varchar(30) NULL,
	x_vrs_id varchar(50) NULL,
	lndng_site_offr_id varchar(15) NULL,
	lndng_st_trtmnt_id varchar(15) NULL
);


-- landing.s_contact definition

-- Drop table

-- DROP TABLE landing.s_contact;

CREATE TABLE landing.s_contact (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL DEFAULT 'x'::character varying,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	court_pay_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	disa_cleanse_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	disp_img_auth_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	email_sr_upd_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	emp_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	fst_name varchar(50) NOT NULL,
	invstgtr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	last_name varchar(50) NOT NULL,
	person_uid varchar(100) NOT NULL DEFAULT 'x'::character varying,
	po_pay_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	priv_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	prospect_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	ptshp_contact_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	ptshp_key_con_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	send_survey_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	speaker_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	suppress_email_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	suppress_fax_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	suspect_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	susp_wtch_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	agent_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	enterprise_flag bpchar(1) NULL DEFAULT 'N'::bpchar,
	member_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	ok_to_sample_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	provider_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	pr_rep_dnrm_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	pr_rep_manl_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	pr_rep_sys_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	send_fin_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	send_news_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	send_promotes_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	suppress_call_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	suppress_mail_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	age int4 NULL,
	annl_incm_amt int4 NULL,
	annl_incm_exch_dt timestamp NULL,
	asgn_dt timestamp NULL,
	asgn_excld_flg2 bpchar(1) NULL,
	asgn_required_flg2 bpchar(1) NULL,
	asgn_usr_excld_flg bpchar(1) NULL,
	birth_dt timestamp NULL,
	call_flg bpchar(1) NULL,
	consumer_flg bpchar(1) NULL,
	con_created_dt timestamp NULL,
	credit_score int4 NULL,
	cust_end_dt timestamp NULL,
	cust_since_dt timestamp NULL,
	db_last_upd timestamp NULL,
	death_dt timestamp NULL,
	dedup_dataclnsd_dt timestamp NULL,
	dedup_key_upd_dt timestamp NULL,
	dedup_last_mtch_dt timestamp NULL,
	hard_to_reach bpchar(1) NULL,
	inves_start_dt timestamp NULL,
	inv_org_st_dt timestamp NULL,
	last_credit_dt timestamp NULL,
	latitude int4 NULL,
	longitude int4 NULL,
	lst_emladr_upd_ts timestamp NULL,
	mgmnt_flg bpchar(1) NULL,
	num_hard_bnce int4 NULL,
	num_soft_bnce int4 NULL,
	seminar_invit_flg bpchar(1) NULL,
	active_cti_cfg_id varchar(15) NULL,
	active_teleset_id varchar(15) NULL,
	aia_integ_id varchar(150) NULL,
	alias_name varchar(50) NULL,
	alt_email_addr varchar(350) NULL,
	alt_email_loc_cd varchar(30) NULL,
	alt_ph_num varchar(40) NULL,
	annl_incm_curcy_cd varchar(20) NULL,
	approval_status_cd varchar(30) NULL,
	area_id varchar(15) NULL,
	asst_ph_num varchar(40) NULL,
	call_frequency varchar(30) NULL,
	cell_ph_num varchar(40) NULL,
	citizenship_cd varchar(30) NULL,
	"comments" varchar(255) NULL,
	complexion_cd varchar(30) NULL,
	con_asst_name varchar(50) NULL,
	con_asst_per_id varchar(15) NULL,
	con_cd varchar(30) NULL,
	con_exper_cd varchar(30) NULL,
	con_image_id varchar(15) NULL,
	con_influnc_id varchar(15) NULL,
	con_manager_name varchar(50) NULL,
	con_manager_per_id varchar(15) NULL,
	corp_ptrnl_lstname varchar(50) NULL,
	country_template varchar(15) NULL,
	creator_login varchar(50) NULL,
	credit_agency varchar(30) NULL,
	csn varchar(50) NULL,
	curr_pri_lst_id varchar(15) NULL,
	cust_stat_cd varchar(30) NULL,
	cust_value_cd varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	decision_type_cd varchar(30) NULL,
	dedup_token varchar(100) NULL,
	"degree" varchar(30) NULL,
	dflt_order_proc_cd varchar(30) NULL,
	email_addr varchar(350) NULL,
	email_loc_cd varchar(30) NULL,
	email_status_cd varchar(30) NULL,
	emplmnt_stat_cd varchar(30) NULL,
	emp_id varchar(15) NULL,
	emp_num varchar(30) NULL,
	emp_work_loc_name varchar(50) NULL,
	ethnicity_cd varchar(30) NULL,
	eye_color varchar(30) NULL,
	fax_ph_num varchar(40) NULL,
	furi_ptrnl_lstname varchar(50) NULL,
	hair_color varchar(30) NULL,
	height varchar(20) NULL,
	height_uom_cd varchar(30) NULL,
	home_ph_num varchar(40) NULL,
	indust_id varchar(15) NULL,
	integration_id varchar(30) NULL,
	job_title varchar(75) NULL,
	left_eye_clr_cd varchar(30) NULL,
	login varchar(50) NULL,
	maiden_name varchar(50) NULL,
	marital_stat_cd varchar(30) NULL,
	med_spec_id varchar(15) NULL,
	mid_name varchar(50) NULL,
	mother_maiden_name varchar(50) NULL,
	mstr_case_id varchar(15) NULL,
	nationality varchar(30) NULL,
	new_user_resp_name varchar(50) NULL,
	nick_name varchar(50) NULL,
	occupation varchar(50) NULL,
	ou_id varchar(15) NULL,
	ou_mail_stop varchar(30) NULL,
	owner_login varchar(50) NULL,
	owner_per_id varchar(15) NULL,
	pager_company_id varchar(15) NULL,
	pager_num varchar(40) NULL,
	pager_ph_num varchar(40) NULL,
	pager_pin varchar(40) NULL,
	pager_type_cd varchar(30) NULL,
	"password" varchar(20) NULL,
	paternal_last_name varchar(50) NULL,
	per_title varchar(15) NULL,
	per_title_suffix varchar(15) NULL,
	place_of_birth varchar(100) NULL,
	postn_cd varchar(30) NULL,
	practice_type varchar(30) NULL,
	pref_comm_media_cd varchar(30) NULL,
	pref_comm_meth_cd varchar(30) NULL,
	pref_lang_id varchar(15) NULL,
	pref_locale_id varchar(15) NULL,
	pref_sale_dlr_id varchar(15) NULL,
	presence_uri varchar(100) NULL,
	privacy_cd varchar(30) NULL,
	pr_act_id varchar(15) NULL,
	pr_affl_id varchar(15) NULL,
	pr_alt_ph_num_id varchar(15) NULL,
	pr_asset_id varchar(15) NULL,
	pr_bl_per_addr_id varchar(15) NULL,
	pr_client_ou_id varchar(15) NULL,
	pr_comm_lang_id varchar(15) NULL,
	pr_con_addr_id varchar(15) NULL,
	pr_cst_accnt_id varchar(15) NULL,
	pr_cti_cfg_id varchar(15) NULL,
	pr_dept_ou_id varchar(15) NULL,
	pr_drvr_license_id varchar(15) NULL,
	pr_email_addr_id varchar(15) NULL,
	pr_facility_id varchar(15) NULL,
	pr_grp_ou_id varchar(15) NULL,
	pr_held_postn_id varchar(15) NULL,
	pr_image_id varchar(15) NULL,
	pr_indust_id varchar(15) NULL,
	pr_mkt_seg_id varchar(15) NULL,
	pr_note_id varchar(15) NULL,
	pr_opty_id varchar(15) NULL,
	pr_ou_addr_id varchar(15) NULL,
	pr_per_addr_id varchar(15) NULL,
	pr_per_pay_prfl_id varchar(15) NULL,
	pr_phone_id varchar(15) NULL,
	pr_postn_id varchar(15) NULL,
	pr_prod_id varchar(15) NULL,
	pr_prod_ln_id varchar(15) NULL,
	pr_region_id varchar(15) NULL,
	pr_resp_id varchar(15) NULL,
	pr_security_id varchar(15) NULL,
	pr_sh_per_addr_id varchar(15) NULL,
	pr_specialty_id varchar(15) NULL,
	pr_state_lic_id varchar(15) NULL,
	pr_sync_user_id varchar(15) NULL,
	pr_terr_id varchar(15) NULL,
	pr_userrole_id varchar(15) NULL,
	race varchar(30) NULL,
	rating varchar(30) NULL,
	region_id varchar(15) NULL,
	regl_stat_cd varchar(30) NULL,
	reliability_cd varchar(30) NULL,
	resident_stat_cd varchar(30) NULL,
	right_eye_clr_cd varchar(30) NULL,
	route varchar(30) NULL,
	sec_answr varchar(50) NULL,
	sec_quest_cd varchar(30) NULL,
	sex_mf varchar(30) NULL,
	soc_security_num varchar(20) NULL,
	spouse_last_name varchar(50) NULL,
	src_id varchar(15) NULL,
	status_cd varchar(30) NULL,
	stat_reason_cd varchar(30) NULL,
	stock_portfolio varchar(500) NULL,
	sub_spec_id varchar(15) NULL,
	svc_branch_id varchar(15) NULL,
	timezone_id varchar(15) NULL,
	tmzone_cd varchar(30) NULL,
	weathr_loc_pref varchar(75) NULL,
	web_region_id varchar(15) NULL,
	weight varchar(20) NULL,
	weight_uom_cd varchar(30) NULL,
	work_ph_num varchar(40) NULL,
	x_account_id varchar(30) NULL,
	x_as_of_date timestamp NULL,
	x_assist_id varchar(30) NULL,
	x_cpf varchar(30) NULL,
	x_current_car_model varchar(30) NULL,
	x_customer_id varchar(30) NULL,
	x_daug_num int4 NULL,
	x_deceased_flg bpchar(1) NULL,
	x_expect_purchase varchar(30) NULL,
	x_ext_myh_dt timestamp NULL,
	x_ext_myh_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	x_family_size varchar(30) NULL,
	x_fst_name_up varchar(50) NULL,
	x_info_source varchar(30) NULL,
	x_intend_repl_date varchar(30) NULL,
	x_internal_flg bpchar(1) NULL,
	x_last_name_up varchar(50) NULL,
	x_middle_name_up varchar(50) NULL,
	x_myh_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	x_near_dealer_city varchar(30) NULL,
	x_near_dealer_state varchar(30) NULL,
	x_optin_email bpchar(1) NULL,
	x_optin_events_flg bpchar(1) NULL,
	x_optin_megazine_flg bpchar(1) NULL,
	x_optin_news_flg bpchar(1) NULL,
	x_optin_offer_flg bpchar(1) NULL,
	x_optin_phone bpchar(1) NULL,
	x_optin_product_flg bpchar(1) NULL,
	x_optin_research_flg bpchar(1) NULL,
	x_optin_retail_flg bpchar(1) NULL,
	x_optin_sms bpchar(1) NULL,
	x_optout_3rd_party bpchar(1) NULL,
	x_optout_hmuk bpchar(1) NULL,
	x_report_to_id varchar(30) NULL,
	x_rider_club_flg bpchar(1) NULL,
	x_robinson_flg bpchar(1) NULL,
	x_salesmatch_flg bpchar(1) NULL,
	x_son_num int4 NULL,
	x_sup_gone_away bpchar(1) NULL,
	x_sup_in_dispute bpchar(1) NULL,
	x_sup_mps bpchar(1) NULL,
	x_sup_no_dealer bpchar(1) NULL,
	x_sup_no_market bpchar(1) NULL,
	x_sup_sms_flg bpchar(1) NULL,
	x_sup_tps bpchar(1) NULL,
	x_trav_rest_flg bpchar(1) NULL,
	x_sanitized_flg bpchar(1) NULL,
	x_rowid_to_num varchar(50) NULL,
	x_printed_card bpchar(1) NULL,
	x_pne_flg bpchar(1) NULL,
	aia_integ1_id varchar(500) NULL,
	consumer_ref_id varchar(15) NULL,
	death_cert_num varchar(30) NULL,
	img_src_path varchar(500) NULL,
	marital_stat_dt timestamp NULL,
	od_last_upd_by varchar(125) NULL,
	ondemand_sync_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	place_of_death varchar(50) NULL,
	tax_eval_type_cd varchar(30) NULL,
	tax_iden_num varchar(50) NULL,
	thmbnl_imgsrc_path varchar(500) NULL,
	veteran_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	x_dealer_sel_id varchar(30) NULL,
	x_dealer_serv_id varchar(30) NULL
);
CREATE INDEX s_contact_con_cd_idx ON landing.s_contact USING btree (con_cd);
CREATE UNIQUE INDEX unique_s_contact ON landing.s_contact USING btree (row_id);


-- landing.s_contact_att definition

-- Drop table

-- DROP TABLE landing.s_contact_att;

CREATE TABLE landing.s_contact_att (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT now(),
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT now(),
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	file_auto_upd_flg bpchar(1) NOT NULL,
	file_defer_flg bpchar(1) NOT NULL,
	file_dock_req_flg bpchar(1) NOT NULL,
	file_dock_stat_flg bpchar(1) NOT NULL,
	file_name varchar(200) NOT NULL,
	db_last_upd timestamp NULL,
	file_date timestamp NULL,
	file_size numeric(10) NULL,
	"comments" varchar(250) NULL,
	db_last_upd_src varchar(50) NULL,
	file_ext varchar(10) NULL,
	file_rev_num varchar(15) NULL,
	file_src_path varchar(255) NULL,
	file_src_type varchar(30) NULL,
	keyword varchar(255) NULL,
	type_cd varchar(30) NULL
);


-- landing.s_contact_complete definition

-- Drop table

-- DROP TABLE landing.s_contact_complete;

CREATE TABLE landing.s_contact_complete (
	row_id varchar(15) NOT NULL,
	work_dt timestamp NULL,
	work_num int4 NULL,
	CONSTRAINT s_contact_complete_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_s_contact_complete ON landing.s_contact_complete USING btree (row_id);


-- landing.s_contact_fnx definition

-- Drop table

-- DROP TABLE landing.s_contact_fnx;

CREATE TABLE landing.s_contact_fnx (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	addr_verify_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	attrny_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	chk_trunc_rcv_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	grand_child_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	hlthcr_attrny_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	liab_provd_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	oblg_past_due_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	post_nuptl_agr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	pre_nuptl_agr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	prosrv_intract_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	stmt_prep_prof_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	trust_execute_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	will_execute_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	will_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	wire_active_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	accss_frd_file_flg bpchar(1) NULL,
	agent_num int4 NULL,
	agnt_contract_dt timestamp NULL,
	ams_capability_lvl int4 NULL,
	annl_income int4 NULL,
	annl_income_dt timestamp NULL,
	annl_revenue int4 NULL,
	arch_reqst_flg bpchar(1) NULL,
	bk_bnk_fee_amt int4 NULL,
	bk_claim_amt int4 NULL,
	bk_claim_dt timestamp NULL,
	bk_dsclosr_dt timestamp NULL,
	bk_filed_dt timestamp NULL,
	bk_grant_amt int4 NULL,
	bk_hearing_dt timestamp NULL,
	bk_lgl_fee_amt int4 NULL,
	bk_petition_dt timestamp NULL,
	bk_rcvd_amt int4 NULL,
	bk_reaffrm_amt int4 NULL,
	bk_reaffrm_dt timestamp NULL,
	bk_remaing_amt int4 NULL,
	bk_sec_dep_amt int4 NULL,
	bk_stiplatn_dt timestamp NULL,
	bl_outpymnt_amt int4 NULL,
	brloc_attrib03 int4 NULL,
	brloc_attrib08 bpchar(1) NULL,
	brloc_attrib09 bpchar(1) NULL,
	brloc_attrib10 bpchar(1) NULL,
	brloc_attrib11 bpchar(1) NULL,
	brloc_attrib12 bpchar(1) NULL,
	brloc_attrib13 bpchar(1) NULL,
	cash_amt int4 NULL,
	cbr_service_lvl int4 NULL,
	clear_dup_auth_flg bpchar(1) NULL,
	clear_frd_auth_flg bpchar(1) NULL,
	cmnuty_prpty_dt timestamp NULL,
	cob_flg bpchar(1) NULL,
	comp_owner_flg bpchar(1) NULL,
	crdt_scre_ovrd_flg bpchar(1) NULL,
	credit_bur_hit_num int4 NULL,
	credit_score int4 NULL,
	crrpt_req_flg bpchar(1) NULL,
	db_last_upd timestamp NULL,
	deceased_flg bpchar(1) NULL,
	dlr_tlr_ovrd_flg bpchar(1) NULL,
	dr_license_exp_dt timestamp NULL,
	ebpp_enrl_flg bpchar(1) NULL,
	ebp_enrl_flg bpchar(1) NULL,
	ebp_paymt_limit int4 NULL,
	empl_start_dt timestamp NULL,
	entrd_regn_flg bpchar(1) NULL,
	finplan_compl_dt timestamp NULL,
	fst_auto_ins_dt timestamp NULL,
	hltcr_poa_upd_dt timestamp NULL,
	hold_pymt_flg bpchar(1) NULL,
	iden2_exp_dt timestamp NULL,
	iden_exp_dt timestamp NULL,
	ins_need_rev_dt timestamp NULL,
	irr_instrst_upd_dt timestamp NULL,
	irr_trst_upd_dt timestamp NULL,
	jobs_five_yrs int4 NULL,
	last_contacted_dt timestamp NULL,
	last_marriage_dt timestamp NULL,
	live_trust_dt timestamp NULL,
	live_will_upd_dt timestamp NULL,
	loan_foreclsure_dt timestamp NULL,
	lst_will_upd_dt timestamp NULL,
	max_rqst_prty_lvl int4 NULL,
	mth_oblg_amt int4 NULL,
	no_yrs_school int4 NULL,
	num_depends int4 NULL,
	num_est_deposit int4 NULL,
	num_vac_days int4 NULL,
	num_visit_resd int4 NULL,
	num_visit_work int4 NULL,
	ofac_fst_access_dt timestamp NULL,
	ofac_lst_access_dt timestamp NULL,
	ovrd_auto_val_flg bpchar(1) NULL,
	passport_exp_dt timestamp NULL,
	passport_issue_dt timestamp NULL,
	perm_resident_flg bpchar(1) NULL,
	persist_ratio int4 NULL,
	poa_upd_dt timestamp NULL,
	post_nuptl_agr_dt timestamp NULL,
	pre_nuptl_agr_dt timestamp NULL,
	recv_trust_upd_dt timestamp NULL,
	resdnce_val int4 NULL,
	resdnce_yrs int4 NULL,
	retired_flg bpchar(1) NULL,
	revoc_trst_upd_dt timestamp NULL,
	scr_rpt_ovrd_flg bpchar(1) NULL,
	self_empl_flg bpchar(1) NULL,
	spouse_birth_dt timestamp NULL,
	state_iden_dt timestamp NULL,
	stg_rte_ovrd_flg bpchar(1) NULL,
	tax_bracket int4 NULL,
	total_asset int4 NULL,
	total_liability int4 NULL,
	trust_agree_dt timestamp NULL,
	turndown_auth_flg bpchar(1) NULL,
	us_citizen_flg bpchar(1) NULL,
	wed_anvrsry_dt timestamp NULL,
	years_emplymt int4 NULL,
	yl_last_login_ts timestamp NULL,
	yl_last_upd_ts timestamp NULL,
	yl_start_upd_ts timestamp NULL,
	access_lvl_cd varchar(30) NULL,
	annl_rev_curcy_cd varchar(20) NULL,
	attrition_risk_cd varchar(30) NULL,
	auth_text varchar(250) NULL,
	behaviour_cd varchar(30) NULL,
	best_calltm_cd varchar(30) NULL,
	bill_pay_mthd_cd varchar(30) NULL,
	birth_place varchar(50) NULL,
	bk_case_num varchar(10) NULL,
	bk_chptr_cd varchar(30) NULL,
	bk_court_name varchar(50) NULL,
	bk_ref_asset_id varchar(15) NULL,
	bk_ref_asset_name varchar(50) NULL,
	brloc_attrib01 varchar(50) NULL,
	brloc_attrib02 varchar(30) NULL,
	brloc_attrib04 varchar(30) NULL,
	brloc_attrib05 varchar(10) NULL,
	brloc_attrib06 varchar(30) NULL,
	brloc_attrib07 varchar(30) NULL,
	com_preference varchar(30) NULL,
	crrpt_fmt_cd varchar(30) NULL,
	curr_funds_mgd varchar(250) NULL,
	db_last_upd_src varchar(50) NULL,
	dear_name varchar(50) NULL,
	debt_feel_cd varchar(30) NULL,
	depends_desc varchar(50) NULL,
	dept_type_cd varchar(30) NULL,
	dr_license_num varchar(40) NULL,
	dr_license_state varchar(30) NULL,
	ebp_iden_num varchar(30) NULL,
	education varchar(250) NULL,
	edu_cd varchar(30) NULL,
	employer_name varchar(250) NULL,
	eval_stat_cd varchar(30) NULL,
	evidence_reason varchar(250) NULL,
	goals varchar(250) NULL,
	height varchar(20) NULL,
	hist_funds_mgd varchar(250) NULL,
	hobby_cd varchar(30) NULL,
	iden2_num varchar(40) NULL,
	iden2_state_cd varchar(30) NULL,
	iden2_type_cd varchar(30) NULL,
	iden_num varchar(40) NULL,
	iden_state_cd varchar(30) NULL,
	iden_type_cd varchar(30) NULL,
	income_range_cd varchar(30) NULL,
	info_source_cd varchar(30) NULL,
	ins_cvrg_cd varchar(30) NULL,
	interests_text varchar(250) NULL,
	intr_chg_imp_cd varchar(30) NULL,
	intr_rate_srvey_cd varchar(30) NULL,
	invst_expr_cd varchar(30) NULL,
	invst_horiz_cd varchar(30) NULL,
	invst_knwldg_cd varchar(30) NULL,
	invst_obj_cd varchar(30) NULL,
	invst_profile_cd varchar(30) NULL,
	invst_risk_cd varchar(30) NULL,
	issue_desc varchar(250) NULL,
	last_contacted_by varchar(15) NULL,
	life_event_cd varchar(30) NULL,
	liqudty_srvey_cd varchar(30) NULL,
	lob_refer_src_cd varchar(30) NULL,
	member_num varchar(50) NULL,
	mgr_tenure varchar(20) NULL,
	mrkt_cap_pref_cd varchar(30) NULL,
	net_worth_cd varchar(30) NULL,
	net_wrthvalmthd_cd varchar(30) NULL,
	net_wrthvaltype_cd varchar(30) NULL,
	net_wrth_src_cd varchar(30) NULL,
	not_verified_reasn varchar(250) NULL,
	npi_num varchar(30) NULL,
	ofac_stat_cd varchar(30) NULL,
	panel_cd varchar(30) NULL,
	peeves_text varchar(250) NULL,
	perf_expect_cd varchar(30) NULL,
	phlntrphy_objtv_cd varchar(30) NULL,
	post_retirement_cd varchar(30) NULL,
	practice_cd varchar(30) NULL,
	prev_bank_branch varchar(50) NULL,
	prev_bank_ph_num varchar(40) NULL,
	pronunciation varchar(100) NULL,
	pr_metrp_stat_area varchar(10) NULL,
	purch_type_cd varchar(30) NULL,
	refer_src_cd varchar(30) NULL,
	region_cd varchar(30) NULL,
	resdnce_catg_cd varchar(30) NULL,
	resdnce_type_cd varchar(30) NULL,
	residency_instn varchar(50) NULL,
	risk_rating_info varchar(50) NULL,
	rsrch_chnl_pref_cd varchar(30) NULL,
	salutation_cd varchar(30) NULL,
	service_guideline varchar(250) NULL,
	show_appl_choice varchar(100) NULL,
	status_cd varchar(30) NULL,
	stmt_format_cd varchar(30) NULL,
	stmt_freq_cd varchar(30) NULL,
	tech_imp_cd varchar(30) NULL,
	tlr_intg_msg varchar(250) NULL,
	tlr_intg_ret_cd varchar(30) NULL,
	upin_num varchar(30) NULL,
	weight varchar(20) NULL,
	will_prep_loc varchar(50) NULL,
	yl_encrpkey_ref varchar(30) NULL,
	yl_lastupd_type_cd varchar(30) NULL,
	yl_last_err_msg varchar(250) NULL,
	yl_last_upd_status varchar(50) NULL,
	yl_login varchar(50) NULL,
	yl_passwd varchar(90) NULL,
	yl_status varchar(40) NULL,
	x_emp_area varchar(30) NULL,
	accnt_frozen_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	antimny_lndrng_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	credit_rating_val varchar(30) NULL,
	ext_sys_liab_iden varchar(30) NULL,
	fsa_class_cd varchar(30) NULL,
	guardian_name varchar(100) NULL,
	guardian_type_cd varchar(30) NULL,
	know_your_cust_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	limit_curcy_cd varchar(20) NULL,
	limit_revision_dt timestamp NULL,
	minor_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	overall_limit_amt int4 NULL,
	rel_pricing_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	risk_category_cd varchar(30) NULL,
	rsk_prof_mature_dt timestamp NULL,
	ttl_utilzd_lmt_amt int4 NULL,
	whrabts_unknwn_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar
);
CREATE UNIQUE INDEX unique_s_contact_fnx ON landing.s_contact_fnx USING btree (row_id);


-- landing.s_contact_loyx definition

-- Drop table

-- DROP TABLE landing.s_contact_loyx;

CREATE TABLE landing.s_contact_loyx (
	row_id varchar(15) NOT NULL,
	created timestamp NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	smoke_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	suppress_sms_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	db_last_upd timestamp NULL,
	expiration_dt timestamp NULL,
	issue_dt timestamp NULL,
	passport_expr_dt timestamp NULL,
	passport_issue_dt timestamp NULL,
	"comments" varchar(250) NULL,
	country varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	drvr_lic_number varchar(30) NULL,
	drvr_lic_state_cd varchar(10) NULL,
	emgc_cell_ph_num varchar(40) NULL,
	emgc_email_addr varchar(350) NULL,
	emgc_per_id varchar(15) NULL,
	emgc_ph_num varchar(40) NULL,
	home_airport varchar(30) NULL,
	issue_site varchar(30) NULL,
	passport_num varchar(50) NULL,
	pref1_air_id varchar(15) NULL,
	pref1_hotel_id varchar(15) NULL,
	pref1_rental_id varchar(15) NULL,
	pref2_air_id varchar(15) NULL,
	pref2_hotel_id varchar(15) NULL,
	pref2_rental_id varchar(15) NULL,
	pref_bed_cd varchar(30) NULL,
	pref_car_cd varchar(30) NULL,
	pref_cruise_ln_cd varchar(30) NULL,
	pref_hotl_brand_cd varchar(30) NULL,
	pref_hotl_chain_cd varchar(30) NULL,
	pref_loc_cd varchar(30) NULL,
	pref_meal_cd varchar(30) NULL,
	pref_paper_cd varchar(30) NULL,
	pref_seat_cd varchar(30) NULL,
	pref_smokeing_cd varchar(30) NULL,
	prev_fst_name varchar(50) NULL,
	prev_lst_name varchar(50) NULL,
	prev_mi_name varchar(50) NULL,
	pr_fax_num_id varchar(15) NULL,
	pr_loy_member_id varchar(15) NULL,
	pr_sms_num_id varchar(15) NULL,
	referred_by_id varchar(15) NULL,
	spec_air_req_text varchar(250) NULL,
	spec_hotel_req_txt varchar(250) NULL,
	spec_med_req_text varchar(250) NULL,
	spec_rentl_req_txt varchar(250) NULL
);


-- landing.s_contact_x definition

-- Drop table

-- DROP TABLE landing.s_contact_x;

CREATE TABLE landing.s_contact_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 int4 NULL,
	attrib_15 int4 NULL,
	attrib_16 int4 NULL,
	attrib_17 int4 NULL,
	attrib_18 int4 NULL,
	attrib_19 int4 NULL,
	attrib_20 int4 NULL,
	attrib_21 int4 NULL,
	attrib_22 int4 NULL,
	attrib_23 int4 NULL,
	attrib_24 int4 NULL,
	attrib_25 int4 NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	attrib_56 int4 NULL,
	attrib_57 int4 NULL,
	attrib_58 int4 NULL,
	attrib_59 int4 NULL,
	attrib_60 int4 NULL,
	attrib_61 int4 NULL,
	attrib_62 int4 NULL,
	attrib_63 int4 NULL,
	attrib_64 int4 NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	attrib_48 varchar(250) NULL,
	attrib_49 varchar(100) NULL,
	attrib_50 varchar(100) NULL,
	attrib_51 varchar(100) NULL,
	attrib_52 varchar(100) NULL,
	attrib_53 varchar(100) NULL,
	attrib_54 varchar(100) NULL,
	attrib_55 varchar(100) NULL,
	db_last_upd_src varchar(50) NULL,
	cod_coordenada varchar(100) NULL,
	coord_x varchar(100) NULL,
	coord_y varchar(100) NULL,
	factor_05_1 varchar(100) NULL,
	factor_05_2 varchar(100) NULL,
	factor_05_3 varchar(100) NULL,
	factor_05_4 varchar(100) NULL,
	factor_05_5 varchar(100) NULL,
	factor_05_6 varchar(100) NULL,
	grupo_mosaic_05 varchar(100) NULL,
	lived_city1 varchar(50) NULL,
	lived_country varchar(30) NULL,
	lived_post_code1 varchar(30) NULL,
	lived_region varchar(50) NULL,
	lived_str_suppl1 varchar(100) NULL,
	lived_str_suppl2 varchar(100) NULL,
	lived_str_suppl3 varchar(100) NULL,
	sscc_01 varchar(100) NULL,
	temp_city1 varchar(50) NULL,
	temp_country varchar(30) NULL,
	temp_post_code1 varchar(30) NULL,
	temp_region varchar(50) NULL,
	temp_str_suppl1 varchar(100) NULL,
	temp_str_suppl2 varchar(100) NULL,
	temp_str_suppl3 varchar(100) NULL,
	tipo_tramo_05 varchar(100) NULL,
	tramo_mosaic_05 varchar(100) NULL,
	x_called_by varchar(30) NULL,
	x_employee_flg bpchar(1) NULL,
	x_literacy varchar(30) NULL,
	x_receive_call bpchar(1) NULL,
	x_receive_email bpchar(1) NULL,
	x_receive_letter bpchar(1) NULL,
	x_receive_sms bpchar(1) NULL,
	x_replaced_row_id varchar(15) NULL,
	x_seg_behavioral varchar(30) NULL,
	x_seg_facebook varchar(30) NULL,
	x_seg_google varchar(30) NULL,
	x_seg_interest varchar(30) NULL,
	x_seg_life_cycle varchar(30) NULL,
	x_seg_value varchar(30) NULL,
	x_snt_birth_date_flg bpchar(1) NULL,
	x_snt_cell_ph_num_flg bpchar(1) NULL,
	x_snt_cpf_flg bpchar(1) NULL,
	x_snt_email_addr_flg bpchar(1) NULL,
	x_snt_fst_name_flg bpchar(1) NULL,
	x_snt_home_ph_num_flg bpchar(1) NULL,
	x_snt_last_name_flg bpchar(1) NULL,
	x_snt_work_ph_num_flg bpchar(1) NULL,
	x_amount_children int4 NULL,
	x_amount_friends int4 NULL,
	x_cnh_exp_date timestamp NULL,
	x_loyalty_act_dt timestamp NULL,
	x_loyalty_crm_index varchar(30) NULL,
	x_loyalty_engagement varchar(30) NULL,
	x_loyalty_exp_dt timestamp NULL,
	x_loyalty_optin_flg bpchar(1) NULL,
	x_loyalty_satisfaction varchar(30) NULL,
	x_loyalty_status varchar(30) NULL,
	x_already_customer bpchar(1) NULL DEFAULT 'N'::bpchar,
	x_favorite_dealer varchar(30) NULL
);
CREATE UNIQUE INDEX unique_s_contact_x ON landing.s_contact_x USING btree (row_id);


-- landing.s_contact_xm definition

-- Drop table

-- DROP TABLE landing.s_contact_xm;

CREATE TABLE landing.s_contact_xm (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 numeric(22, 7) NULL,
	attrib_15 int4 NULL,
	attrib_16 int4 NULL,
	attrib_17 int4 NULL,
	attrib_18 int4 NULL,
	attrib_19 int4 NULL,
	attrib_20 int4 NULL,
	attrib_21 int4 NULL,
	attrib_22 int4 NULL,
	attrib_23 int4 NULL,
	attrib_24 int4 NULL,
	attrib_25 int4 NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	db_last_upd_src varchar(50) NULL,
	x_attrib_47 varchar(100) NULL,
	x_attrib_48 varchar(50) NULL,
	x_attrib_49 varchar(50) NULL,
	x_attrib_50 varchar(50) NULL,
	x_app_start_date timestamp NULL,
	x_app_status varchar(30) NULL,
	x_children_birth_date timestamp NULL,
	x_soc_med_join_date timestamp NULL,
	x_soc_med_like_hmb_flg bpchar(1) NULL,
	x_soc_med_user varchar(50) NULL,
	x_vehicle_intent_change varchar(30) NULL,
	x_vehicle_year_model varchar(30) NULL,
	x_is_current_flg bpchar(1) NULL,
	x_model varchar(30) NULL,
	x_name varchar(100) NULL,
	x_license_plate varchar(30) NULL,
	x_main_drive_prop bpchar(1) NULL,
	x_vehicle_color varchar(30) NULL,
	x_source_city varchar(30) NULL,
	x_day_name varchar(30) NULL,
	x_dealer_id varchar(15) NULL,
	x_vehicle_cli_expec_val int4 NULL
);
CREATE UNIQUE INDEX unique_s_contact_xm ON landing.s_contact_xm USING btree (row_id);


-- landing.s_dmnd_crtn_prg definition

-- Drop table

-- DROP TABLE landing.s_dmnd_crtn_prg;

CREATE TABLE landing.s_dmnd_crtn_prg (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	active_inbnd_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	act_done_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	act_priv_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	attch_bkmrk_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	comm_meth_cd varchar(30) NOT NULL DEFAULT 'Indirect'::character varying,
	crt_act_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	html_fmt_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	kiosk_mode_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	lgl_appr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	media_type_cd varchar(30) NOT NULL,
	mktg_appr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	"name" varchar(100) NOT NULL,
	need_to_sync_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	offer_num varchar(30) NOT NULL DEFAULT 'x'::character varying,
	public_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	redirect_url_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	strt_on_lndpg_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	use_dflt_val_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	bu_id varchar(15) NULL DEFAULT '0-R9NH'::character varying,
	version_num int4 NULL DEFAULT 1,
	act_appt_durtn_min numeric(22, 7) NULL,
	act_plan_end_dt timestamp NULL,
	act_plan_start_dt timestamp NULL,
	act_todo_due_dt timestamp NULL,
	"cost" numeric(22, 7) NULL,
	cost_exch_dt timestamp NULL,
	created_ts timestamp NULL,
	db_last_upd timestamp NULL,
	deploy_ts timestamp NULL,
	dsply_seq_num int4 NULL,
	end_dt timestamp NULL,
	last_sync_dt timestamp NULL,
	lgl_appr_dt timestamp NULL,
	mktg_appr_dt timestamp NULL,
	num_iterations int4 NULL,
	offer_value numeric(22, 7) NULL,
	publish_ts timestamp NULL,
	resume_flg bpchar(1) NULL,
	start_dt timestamp NULL,
	act_cal_type_cd varchar(30) NULL,
	act_comments varchar(100) NULL,
	act_comments_long varchar(1500) NULL,
	act_owner_per_id varchar(15) NULL,
	act_priority_cd varchar(30) NULL,
	act_stat_cd varchar(30) NULL,
	act_todo_cd varchar(30) NULL,
	addr_lbl_tmpl_id varchar(15) NULL,
	appr_stat_cd varchar(30) NULL,
	brkr_decision_id varchar(15) NULL,
	bus_obj_name varchar(75) NULL,
	call_guide_note_id varchar(15) NULL,
	call_lst_id varchar(15) NULL,
	"comments" varchar(250) NULL,
	comm_priority_cd varchar(30) NULL,
	cost_curcy_cd varchar(20) NULL,
	db_last_upd_src varchar(50) NULL,
	dlvry_method_cd varchar(30) NULL,
	dlvry_profile_id varchar(15) NULL,
	dply_instrt_text varchar(250) NULL,
	folder_path varchar(250) NULL,
	ful_org_id varchar(15) NULL,
	landgsite_stat_cd varchar(30) NULL,
	lang_id varchar(15) NULL,
	lgl_appr_emp_id varchar(15) NULL,
	locale_id varchar(15) NULL,
	location_desc varchar(250) NULL,
	margin_cd varchar(30) NULL,
	media_format_cd varchar(30) NULL,
	mktg_appr_emp_id varchar(15) NULL,
	mktg_offr_id varchar(15) NULL,
	mkt_srvy_id varchar(15) NULL,
	msg_sect_cd varchar(30) NULL,
	msg_subj_text varchar(500) NULL,
	next_bttn_text varchar(50) NULL,
	offer_type_cd varchar(30) NULL,
	offr_group_cd varchar(30) NULL,
	orig_creator_id varchar(15) NULL,
	outbnd_mailsrvr_id varchar(15) NULL,
	owner_postn_id varchar(15) NULL,
	period_id varchar(15) NULL,
	priority_cd varchar(30) NULL,
	promo_pri_lst_id varchar(15) NULL,
	pr_campaign_id varchar(15) NULL,
	pr_cs_path_id varchar(15) NULL,
	pr_deal_id varchar(15) NULL,
	pr_lit_id varchar(15) NULL,
	pr_offer_mtrl_id varchar(15) NULL,
	recip_bc_name varchar(75) NULL,
	redirect_url varchar(250) NULL,
	rtd_status_cd varchar(30) NULL,
	saw_server_id varchar(15) NULL,
	shipper_ou_id varchar(15) NULL,
	strt_svy_bttn_text varchar(50) NULL,
	submit_bttn_text varchar(50) NULL,
	test_url_text varchar(250) NULL,
	tiny_url_text varchar(250) NULL,
	title_name varchar(100) NULL,
	tmpl_status_cd varchar(30) NULL,
	url_text varchar(250) NULL,
	tmpl_text text NULL,
	x_message_type_cd varchar(30) NULL,
	x_profile_id varchar(15) NULL,
	x_sender_email varchar(100) NULL,
	x_sender_name varchar(50) NULL,
	x_sender_type_cd varchar(30) NULL,
	x_status varchar(30) NULL,
	x_vehicle_model varchar(30) NULL,
	x_phone_type varchar(30) NULL,
	x_launch_workflow_execute varchar(250) NULL,
	branch_id varchar(15) NULL,
	x_sr_area varchar(30) NULL,
	x_sr_level_4 varchar(30) NULL,
	x_sr_reason_cd varchar(30) NULL,
	x_sr_sub_area varchar(30) NULL,
	x_sr_type_cd varchar(30) NULL
);
CREATE INDEX s_dmnd_crtn_prg_media_type_cd_idx ON landing.s_dmnd_crtn_prg USING btree (media_type_cd);
CREATE UNIQUE INDEX unique_s_dmnd_crtn_prg ON landing.s_dmnd_crtn_prg USING btree (row_id);


-- landing.s_evt_act definition

-- Drop table

-- DROP TABLE landing.s_evt_act;

CREATE TABLE landing.s_evt_act (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	activity_uid varchar(30) NOT NULL DEFAULT 'x'::character varying,
	alarm_flag bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	allow_break_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	appt_rept_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	best_action_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	billable_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	cal_disp_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	cmpltd_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	do_not_route_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	email_att_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	email_forward_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	inst_all_occr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	paper_sign_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	pymnt_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	required_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	row_status varchar(10) NOT NULL DEFAULT 'Y'::character varying,
	sched_locked_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	sign_capture_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	status_rpt_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	template_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	tmsht_rltd_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	asgn_manl_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	asgn_usr_excld_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	max_pymnt_amt int4 NULL DEFAULT 0,
	pymnt_dev_amt int4 NULL DEFAULT 0,
	recpt_req_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	recreate_rcpt_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	acd_call_duration int4 NULL,
	acd_disc_flg bpchar(1) NULL,
	acd_inbound_flg bpchar(1) NULL,
	acd_log_entry_dt timestamp NULL,
	acd_log_entry_tm timestamp NULL,
	acd_wait_tm int4 NULL,
	act_created_dt timestamp NULL,
	amt_exch_dt timestamp NULL,
	appt_alarm_tm_min int4 NULL,
	appt_call_flg bpchar(1) NULL,
	appt_duration_min int4 NULL,
	appt_end_dt timestamp NULL,
	appt_end_tm timestamp NULL,
	appt_rept_end_dt timestamp NULL,
	appt_rept_freq int4 NULL,
	appt_rept_fri_flg bpchar(1) NULL,
	appt_rept_mon_flg bpchar(1) NULL,
	appt_rept_sat_flg bpchar(1) NULL,
	appt_rept_sun_flg bpchar(1) NULL,
	appt_rept_thu_flg bpchar(1) NULL,
	appt_rept_tue_flg bpchar(1) NULL,
	appt_rept_wed_flg bpchar(1) NULL,
	appt_rept_wk_mo int4 NULL,
	appt_start_dt timestamp NULL,
	appt_start_tm timestamp NULL,
	asgn_dnrm_flg bpchar(1) NULL,
	asgn_dt timestamp NULL,
	asgn_sys_flg bpchar(1) NULL,
	assess_1 bpchar(1) NULL,
	assess_10 bpchar(1) NULL,
	assess_11 bpchar(1) NULL,
	assess_12 bpchar(1) NULL,
	assess_13 bpchar(1) NULL,
	assess_14 bpchar(1) NULL,
	assess_15 bpchar(1) NULL,
	assess_16 bpchar(1) NULL,
	assess_17 bpchar(1) NULL,
	assess_18 bpchar(1) NULL,
	assess_19 bpchar(1) NULL,
	assess_2 bpchar(1) NULL,
	assess_20 bpchar(1) NULL,
	assess_3 bpchar(1) NULL,
	assess_4 bpchar(1) NULL,
	assess_5 bpchar(1) NULL,
	assess_6 bpchar(1) NULL,
	assess_7 bpchar(1) NULL,
	assess_8 bpchar(1) NULL,
	assess_9 bpchar(1) NULL,
	associated_cost int4 NULL,
	call_submit_dt timestamp NULL,
	cal_disp_due_flg bpchar(1) NULL,
	cem_due_dt timestamp NULL,
	cem_plan_end_dt timestamp NULL,
	cem_plan_start_dt timestamp NULL,
	cem_total_time int4 NULL,
	cost_exch_dt timestamp NULL,
	db_last_upd timestamp NULL,
	doc_expctd_dt timestamp NULL,
	doc_rcvd_dt timestamp NULL,
	doc_sent_dt timestamp NULL,
	duration_hrs int4 NULL,
	est_cost_amt int4 NULL,
	est_cost_exch_dt timestamp NULL,
	est_rmng_wrk_tm int4 NULL,
	exp_rltd_flg bpchar(1) NULL,
	lead_tm int4 NULL,
	mandatory_flg bpchar(1) NULL,
	participant_num int4 NULL,
	pct_complete int4 NULL,
	priv_flg bpchar(1) NULL,
	todo_actl_end_dt timestamp NULL,
	todo_actl_end_tm timestamp NULL,
	todo_actl_start_dt timestamp NULL,
	todo_actl_start_tm timestamp NULL,
	todo_after_dt timestamp NULL,
	todo_after_tm timestamp NULL,
	todo_due_dt timestamp NULL,
	todo_due_tm timestamp NULL,
	todo_plan_end_dt timestamp NULL,
	todo_plan_end_tm timestamp NULL,
	todo_plan_start_dt timestamp NULL,
	todo_plan_start_tm timestamp NULL,
	travel_tm_min int4 NULL,
	ttl_exp_amt int4 NULL,
	work_tm_min int4 NULL,
	xtrnl_access_flg bpchar(1) NULL,
	accnt_issue_id varchar(15) NULL,
	accnt_objctv_id varchar(15) NULL,
	accnt_src_id varchar(15) NULL,
	act_created_by varchar(15) NULL,
	act_tmpl_id varchar(15) NULL,
	agreement_id varchar(15) NULL,
	agree_id varchar(15) NULL,
	alert_id varchar(15) NULL,
	amt_curcy_cd varchar(20) NULL,
	appl_id varchar(15) NULL,
	appt_rept_appt_id varchar(15) NULL,
	appt_rept_repl_cd varchar(30) NULL,
	appt_rept_type varchar(30) NULL,
	area_id varchar(15) NULL,
	arrest_id varchar(15) NULL,
	assess_for varchar(100) NULL,
	assess_tmpl_id varchar(15) NULL,
	asset_id varchar(15) NULL,
	authority_cd varchar(30) NULL,
	bnft_plan_itm_id varchar(15) NULL,
	called_from_num varchar(40) NULL,
	called_num varchar(40) NULL,
	caller_name varchar(50) NULL,
	caller_type_cd varchar(30) NULL,
	call_id varchar(30) NULL,
	cal_type_cd varchar(30) NULL,
	camp_con_id varchar(15) NULL,
	cem_time_uom_cd varchar(30) NULL,
	cg_src_payment_id varchar(15) NULL,
	class_id varchar(15) NULL,
	cl_ptcl_id varchar(15) NULL,
	cl_ptcl_st_id varchar(15) NULL,
	cl_pymnt_id varchar(15) NULL,
	cl_subj_id varchar(15) NULL,
	"comments" varchar(255) NULL,
	comments_long varchar(1500) NULL,
	comm_id varchar(15) NULL,
	comm_session_hndl varchar(250) NULL,
	con_prdint_id varchar(15) NULL,
	cost_curcy_cd varchar(20) NULL,
	creator_login varchar(50) NULL,
	credit_act_cd varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	disposition_cd varchar(30) NULL,
	done_flg varchar(1) NULL,
	email_bcc_line varchar(2000) NULL,
	email_cc_line varchar(2000) NULL,
	email_recip_addr varchar(350) NULL,
	email_recip_name varchar(50) NULL,
	email_sndr_addr varchar(350) NULL,
	email_sndr_name varchar(50) NULL,
	email_to_line varchar(2000) NULL,
	est_cost_curcy_cd varchar(20) NULL,
	evt_priority_cd varchar(30) NULL,
	evt_stat_cd varchar(30) NULL,
	hlth_enctr_id varchar(15) NULL,
	incident_id varchar(15) NULL,
	insclm_elmnt_id varchar(15) NULL,
	insclm_id varchar(15) NULL,
	integration_id varchar(450) NULL,
	item_id varchar(15) NULL,
	lead_id varchar(15) NULL,
	lead_tm_uom_cd varchar(30) NULL,
	lit_id varchar(15) NULL,
	loc_desc varchar(100) NULL,
	mdf_alloc_id varchar(15) NULL,
	me_evt_id varchar(15) NULL,
	"name" varchar(250) NULL,
	nosale_res_cd varchar(30) NULL,
	objctv_id varchar(15) NULL,
	objective_cd varchar(30) NULL,
	opty_id varchar(15) NULL,
	order_id varchar(15) NULL,
	order_item_id varchar(15) NULL,
	org_group_id varchar(15) NULL,
	override_id varchar(15) NULL,
	owner_login varchar(50) NULL,
	owner_ou_id varchar(15) NULL,
	owner_per_id varchar(15) NULL,
	owner_postn_id varchar(15) NULL,
	part_rpr_id varchar(15) NULL,
	par_evt_id varchar(15) NULL,
	perfrm_by_ou_id varchar(15) NULL,
	perfrm_by_per_id varchar(15) NULL,
	pm_action_id varchar(15) NULL,
	prdpromo_id varchar(15) NULL,
	prem_addr_id varchar(15) NULL,
	prev_act_id varchar(15) NULL,
	pri_lst_id varchar(15) NULL,
	proj_id varchar(15) NULL,
	proj_iss_id varchar(15) NULL,
	proj_item_id varchar(15) NULL,
	pr_asset_id varchar(15) NULL,
	pr_att_id varchar(15) NULL,
	pr_container_id varchar(15) NULL,
	pr_con_id varchar(15) NULL,
	pr_expitem_type_id varchar(15) NULL,
	pr_exp_rpt_id varchar(15) NULL,
	pr_ful_req_id varchar(15) NULL,
	pr_insclm_id varchar(15) NULL,
	pr_opty_id varchar(15) NULL,
	pr_order_id varchar(15) NULL,
	pr_prdint_id varchar(15) NULL,
	pr_prod_cat_id varchar(15) NULL,
	pr_prod_dtl_id varchar(15) NULL,
	pr_sr_id varchar(15) NULL,
	pr_symptom_cd varchar(30) NULL,
	pr_tmsht_line_id varchar(15) NULL,
	publish_cd varchar(30) NULL,
	quote_id varchar(15) NULL,
	quote_item_id varchar(15) NULL,
	rate_lst_id varchar(15) NULL,
	recommend_flg varchar(1) NULL,
	ref_num varchar(30) NULL,
	regarding_cd varchar(30) NULL,
	region_id varchar(15) NULL,
	route_id varchar(15) NULL,
	rply_ph_num varchar(40) NULL,
	rsvp varchar(40) NULL,
	sd_id varchar(15) NULL,
	skin_cd varchar(30) NULL,
	sra_defect_id varchar(15) NULL,
	sra_resolution_cd varchar(30) NULL,
	sra_sr_id varchar(15) NULL,
	sra_stat_cd varchar(30) NULL,
	sra_type_cd varchar(30) NULL,
	src_evt_reg_id varchar(15) NULL,
	src_id varchar(15) NULL,
	srv_regn_id varchar(15) NULL,
	subtype_cd varchar(30) NULL,
	target_ou_addr_id varchar(15) NULL,
	target_ou_id varchar(15) NULL,
	target_per_addr_id varchar(15) NULL,
	target_per_id varchar(15) NULL,
	template_id varchar(15) NULL,
	terr_algn_id varchar(15) NULL,
	tmpl_planitem_id varchar(15) NULL,
	todo_appt_id varchar(15) NULL,
	todo_cd varchar(30) NULL,
	user_msg_id varchar(15) NULL,
	wc_start_view varchar(250) NULL,
	wc_type_cd varchar(30) NULL,
	zipcode varchar(30) NULL,
	info_source_cd varchar(30) NULL,
	x_for_dealer varchar(2000) NULL,
	x_call_id varchar(50) NULL,
	x_act_plan_id varchar(15) NULL,
	x_act_plan_key varchar(2000) NULL,
	x_dlr_id varchar(15) NULL,
	x_target_per_id varchar(15) NULL,
	loy_program_id varchar(15) NULL,
	max_offset_to_strt int4 NULL,
	min_offset_to_strt int4 NULL,
	preceding_act_id varchar(15) NULL,
	status_upd_ts timestamp NULL,
	svc_plan_id varchar(15) NULL,
	work_order_id varchar(15) NULL,
	wrnty_claim_id varchar(15) NULL
);
CREATE UNIQUE INDEX unique_s_evt_act ON landing.s_evt_act USING btree (row_id);


-- landing.s_evt_act_x definition

-- Drop table

-- DROP TABLE landing.s_evt_act_x;

CREATE TABLE landing.s_evt_act_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 numeric(22, 7) NULL,
	attrib_15 numeric(22, 7) NULL,
	attrib_16 numeric(22, 7) NULL,
	attrib_17 numeric(22, 7) NULL,
	attrib_18 numeric(22, 7) NULL,
	attrib_19 numeric(22, 7) NULL,
	attrib_20 numeric(22, 7) NULL,
	attrib_21 numeric(22, 7) NULL,
	attrib_22 numeric(22, 7) NULL,
	attrib_23 numeric(22, 7) NULL,
	attrib_24 numeric(22, 7) NULL,
	attrib_25 numeric(22, 7) NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	db_last_upd_src varchar(50) NULL,
	expected_delivery timestamp NULL,
	hotline_dt timestamp NULL,
	hotline_id varchar(50) NULL,
	mobis_id varchar(50) NULL,
	mobis_status varchar(50) NULL,
	purch_purpose_id varchar(50) NULL,
	pwa_dt timestamp NULL,
	pwa_id varchar(50) NULL,
	ro_dt timestamp NULL,
	ro_id varchar(50) NULL,
	x_dp_user varchar(50) NULL
);
CREATE UNIQUE INDEX unique_s_evt_act_x ON landing.s_evt_act_x USING btree (row_id);


-- landing.s_lst_of_val definition

-- Drop table

-- DROP TABLE landing.s_lst_of_val;

CREATE TABLE landing.s_lst_of_val (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num numeric(22, 7) NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NULL,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	dflt_lic_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	lang_id varchar(15) NOT NULL DEFAULT 'ENU'::character varying,
	mltorg_disalw_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	multi_lingual_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	"name" varchar(50) NOT NULL,
	reqd_lic_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	rplctn_lvl_cd varchar(30) NOT NULL DEFAULT 'ALL'::character varying,
	"type" varchar(30) NOT NULL,
	val varchar(30) NOT NULL,
	modifiable_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	db_last_upd timestamp NULL,
	order_by numeric(22, 7) NULL,
	target_high numeric(22, 7) NULL,
	target_low numeric(22, 7) NULL,
	translate_flg bpchar(1) NULL,
	weighting_factor numeric(22, 7) NULL,
	bitmap_id varchar(15) NULL,
	bu_id varchar(15) NULL,
	code varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	desc_text varchar(255) NULL,
	high varchar(100) NULL,
	integration_id varchar(30) NULL,
	low varchar(100) NULL,
	sub_type varchar(30) NULL
);
CREATE UNIQUE INDEX unique_s_lst_of_val ON landing.s_lst_of_val USING btree (row_id);


-- landing.s_lst_of_val_complete definition

-- Drop table

-- DROP TABLE landing.s_lst_of_val_complete;

CREATE TABLE landing.s_lst_of_val_complete (
	row_id varchar(15) NOT NULL,
	work_dt timestamp NULL,
	work_num int4 NULL,
	CONSTRAINT s_lst_of_val_complete_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_s_lst_of_val_complete ON landing.s_lst_of_val_complete USING btree (row_id);


-- landing.s_mktg_offr definition

-- Drop table

-- DROP TABLE landing.s_mktg_offr;

CREATE TABLE landing.s_mktg_offr (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	"name" varchar(100) NOT NULL,
	offer_num varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	end_dt timestamp NULL,
	start_dt timestamp NULL,
	appr_stat_cd varchar(30) NULL,
	bu_id varchar(15) NULL,
	"comments" varchar(250) NULL,
	db_last_upd_src varchar(50) NULL,
	pri_lst_id varchar(15) NULL,
	prod_promo_id varchar(15) NULL,
	pr_dcp_id varchar(15) NULL,
	type_cd varchar(30) NULL
);
CREATE UNIQUE INDEX unique_s_mktg_offr ON landing.s_mktg_offr USING btree (row_id);


-- landing.s_mktg_srvr_tsk definition

-- Drop table

-- DROP TABLE landing.s_mktg_srvr_tsk;

CREATE TABLE landing.s_mktg_srvr_tsk (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	process_cd varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	end_ts timestamp NULL,
	error_cnt numeric(10) NULL,
	load_row_cnt numeric(10) NULL,
	query_row_cnt numeric(10) NULL,
	start_ts timestamp NULL,
	camp_id varchar(15) NULL,
	camp_ld_wave_id varchar(15) NULL,
	con_sync_schd_id varchar(15) NULL,
	db_last_upd_src varchar(50) NULL,
	desc_text varchar(250) NULL,
	imprt_tsk_id varchar(15) NULL,
	program_id varchar(15) NULL,
	srm_request_id varchar(15) NULL,
	stage_id varchar(15) NULL,
	status_cd varchar(30) NULL,
	user_id varchar(15) NULL
);


-- landing.s_note_accnt definition

-- Drop table

-- DROP TABLE landing.s_note_accnt;

CREATE TABLE landing.s_note_accnt (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	src_row_id varchar(15) NOT NULL,
	db_last_upd timestamp NULL,
	duration numeric(22, 7) NULL,
	end_dt timestamp NULL,
	priv_flg bpchar(1) NULL,
	start_dt timestamp NULL,
	area_cd varchar(30) NULL,
	category_cd varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	note_type varchar(30) NULL,
	priority_cd varchar(30) NULL,
	sub_area_cd varchar(30) NULL,
	target_ou_id varchar(15) NULL,
	unit_cd varchar(30) NULL,
	note text NULL
);


-- landing.s_org_ext definition

-- Drop table

-- DROP TABLE landing.s_org_ext;

CREATE TABLE landing.s_org_ext (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL DEFAULT 'x'::character varying,
	accnt_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	buying_group_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	cg_dedn_auth_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	cg_svp_a_lock_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	cg_svp_lock_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	cg_svp_skip_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	cl_site_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	contract_vis_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	court_pay_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	disa_cleanse_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	evt_loc_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	fcst_org_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	fund_elig_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	good_standing_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	incl_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	int_org_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	"name" varchar(100) NOT NULL,
	plan_group_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	prospect_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	prtnr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	prtnr_publish_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	rplcd_wth_cmpt_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	skip_po_crdchk_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	agency_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	branch_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	briefing_layout varchar(30) NULL DEFAULT 'Default'::character varying,
	client_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	enterprise_flag bpchar(1) NULL DEFAULT 'N'::bpchar,
	facility_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	invstr_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	lang_id varchar(15) NULL DEFAULT 'ENU'::character varying,
	pr_rep_dnrm_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	pr_rep_manl_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	pr_rep_sys_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	agency_inactive_dt timestamp NULL,
	asgn_dt timestamp NULL,
	asgn_usr_excld_flg bpchar(1) NULL,
	asset_amt int4 NULL,
	atm_count int4 NULL,
	avail_credit_amt int4 NULL,
	bill_pblshr_flg bpchar(1) NULL,
	bo_ordqry_end_dt timestamp NULL,
	bo_ordqry_start_dt timestamp NULL,
	cg_cons_end_offset int4 NULL,
	cg_cons_strtoffset int4 NULL,
	cg_prmo_end_offset int4 NULL,
	cg_ship_end_offset int4 NULL,
	cg_ship_strtoffset int4 NULL,
	cg_svp_upper_lock int4 NULL,
	chnl_annl_sales int4 NULL,
	chnl_qtr_sales int4 NULL,
	chnl_sales_growth int4 NULL,
	close_dt timestamp NULL,
	cmpt_flg bpchar(1) NULL,
	credit_days int4 NULL,
	credit_score int4 NULL,
	cur_yr_bk int4 NULL,
	cur_yr_bl int4 NULL,
	cust_end_dt timestamp NULL,
	cust_since_dt timestamp NULL,
	db_last_upd timestamp NULL,
	dedup_dataclnsd_dt timestamp NULL,
	dedup_key_upd_dt timestamp NULL,
	dedup_last_mtch_dt timestamp NULL,
	disa_all_mails_flg bpchar(1) NULL,
	division_count int4 NULL,
	eai_sync_dt timestamp NULL,
	emp_count int4 NULL,
	evt_hotel_std_rt int4 NULL,
	exch_dt timestamp NULL,
	ful_center_flg bpchar(1) NULL,
	gsa_flg bpchar(1) NULL,
	hard_to_reach bpchar(1) NULL,
	hist_sls_exch_dt timestamp NULL,
	hist_sls_vol int4 NULL,
	hshldhd_age int4 NULL,
	hshld_inc int4 NULL,
	hshld_kidage int4 NULL,
	hshld_kids int4 NULL,
	hshld_size int4 NULL,
	last_call_dt timestamp NULL,
	last_mgr_revw_dt timestamp NULL,
	latitude int4 NULL,
	longitude int4 NULL,
	misc_flg bpchar(1) NULL,
	num_hshlds int4 NULL,
	num_of_beds int4 NULL,
	num_regs int4 NULL,
	ori_ts timestamp NULL,
	partner_flg bpchar(1) NULL,
	po_crdchk_thrsh int4 NULL,
	po_crdchk_thrsh_dt timestamp NULL,
	po_pay_exch_dt timestamp NULL,
	po_pay_flg bpchar(1) NULL,
	po_pay_max_amt int4 NULL,
	pri_yr_bk int4 NULL,
	pri_yr_bl int4 NULL,
	proced_flg bpchar(1) NULL,
	prtnrshp_start_dt timestamp NULL,
	prtnr_sales_rank int4 NULL,
	ptntl_sls_exch_dt timestamp NULL,
	ptntl_sls_vol int4 NULL,
	reference_cust_flg bpchar(1) NULL,
	reference_start_dt timestamp NULL,
	sales_emp_cnt int4 NULL,
	service_emp_cnt int4 NULL,
	srv_provdr_flg bpchar(1) NULL,
	stat_chg_dt timestamp NULL,
	store_size int4 NULL,
	suppress_share_flg bpchar(1) NULL,
	supress_call_flg bpchar(1) NULL,
	tax_exempt_flg bpchar(1) NULL,
	trgt_impl_dt timestamp NULL,
	visit_frequency int4 NULL,
	weekly_acv int4 NULL,
	aba_number varchar(50) NULL,
	accnt_pr_cmpt_id varchar(15) NULL,
	accnt_type_cd varchar(30) NULL,
	adl_status varchar(30) NULL,
	agency_indicator varchar(30) NULL,
	agency_nibrs_ind varchar(30) NULL,
	aia_integ_id varchar(150) NULL,
	alias_name varchar(100) NULL,
	alt_email_addr varchar(350) NULL,
	alt_email_loc_cd varchar(30) NULL,
	ans_srvc_ph_num varchar(40) NULL,
	approval_status_cd varchar(30) NULL,
	asgn_ph_ac varchar(5) NULL,
	asgn_ph_cc varchar(5) NULL,
	base_curcy_cd varchar(20) NULL,
	bo_cust_grp_cd varchar(30) NULL,
	branch_type_cd varchar(30) NULL,
	call_frequency varchar(30) NULL,
	cc_txnproc_ac_num varchar(30) NULL,
	cc_txnproc_vndr_id varchar(15) NULL,
	cg_prmo_strt_day varchar(15) NULL,
	cg_svp_status varchar(30) NULL,
	channel_type varchar(50) NULL,
	cmpny_name varchar(50) NULL,
	core_city_cd varchar(30) NULL,
	corp_cmpny_name varchar(50) NULL,
	corp_stock_symbol varchar(20) NULL,
	country_division varchar(30) NULL,
	country_region varchar(30) NULL,
	country_template varchar(15) NULL,
	covered_by varchar(15) NULL,
	creator_login varchar(50) NULL,
	cross_street varchar(40) NULL,
	curr_pri_lst_id varchar(15) NULL,
	curr_rate_lst_id varchar(15) NULL,
	cur_srv_addr_id varchar(15) NULL,
	cur_yr_bk_curcy_cd varchar(20) NULL,
	cur_yr_bl_curcy_cd varchar(20) NULL,
	cust_stat_cd varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	dedup_token varchar(100) NULL,
	dept_num varchar(30) NULL,
	desc_text varchar(255) NULL,
	dflt_ship_prio_cd varchar(30) NULL,
	dist_channel_cd varchar(30) NULL,
	division varchar(25) NULL,
	divn_cd varchar(30) NULL,
	divn_terr_hier_id varchar(15) NULL,
	divn_type_cd varchar(30) NULL,
	dom_ult_duns_num varchar(15) NULL,
	duns_num varchar(15) NULL,
	eai_error_text varchar(2000) NULL,
	eai_exprt_stat_cd varchar(30) NULL,
	email_addr varchar(350) NULL,
	email_loc_cd varchar(30) NULL,
	evt_loc_cd varchar(30) NULL,
	exec_spnsr_pstn_id varchar(15) NULL,
	expertise_cd varchar(30) NULL,
	fbi_field_off_id varchar(15) NULL,
	fin_resp_con_id varchar(15) NULL,
	frd_owner_emp_id varchar(15) NULL,
	frght_terms_cd varchar(30) NULL,
	frght_terms_info varchar(100) NULL,
	furi_cmpny_name varchar(50) NULL,
	general_ledger varchar(50) NULL,
	glblult_duns_num varchar(15) NULL,
	grwth_strtgy_desc varchar(1001) NULL,
	hist_sls_curcy_cd varchar(20) NULL,
	hshldhd_gen_cd varchar(30) NULL,
	hshldhd_occ_cd varchar(30) NULL,
	hshld_ethn_cd varchar(30) NULL,
	hshld_loc_cd varchar(30) NULL,
	impl_desc varchar(1000) NULL,
	impl_stage_cd varchar(30) NULL,
	integration_id varchar(30) NULL,
	judicial_district varchar(30) NULL,
	last_revw_mgr_id varchar(15) NULL,
	legal_form_cd varchar(30) NULL,
	loc varchar(50) NULL,
	location_level varchar(30) NULL,
	loy_partner_cd varchar(30) NULL,
	main_email_addr varchar(350) NULL,
	main_fax_ph_num varchar(40) NULL,
	main_ph_num varchar(40) NULL,
	manager_name varchar(40) NULL,
	market_class_cd varchar(30) NULL,
	market_type_cd varchar(30) NULL,
	master_ou_id varchar(15) NULL,
	name_1 varchar(100) NULL,
	ori_cd varchar(30) NULL,
	ou_num varchar(30) NULL,
	ou_num_1 varchar(30) NULL,
	ou_type_cd varchar(30) NULL,
	ownership_type_cd varchar(30) NULL,
	par_bu_id varchar(15) NULL,
	par_divn_id varchar(15) NULL,
	par_duns_num varchar(15) NULL,
	par_ou_id varchar(15) NULL,
	"password" varchar(20) NULL,
	payment_term_id varchar(15) NULL,
	pay_type_cd varchar(30) NULL,
	population_grp_cd varchar(30) NULL,
	po_pay_curcy_cd varchar(20) NULL,
	pref_carr_prio_cd varchar(30) NULL,
	pref_comm_meth_cd varchar(30) NULL,
	pref_ship_carr_cd varchar(30) NULL,
	privacy_cd varchar(30) NULL,
	pri_grp_cd varchar(30) NULL,
	pri_yr_bk_curcy_cd varchar(20) NULL,
	pri_yr_bl_curcy_cd varchar(20) NULL,
	prod_dist_cd varchar(30) NULL,
	prtnr_cert_cd varchar(30) NULL,
	prtnr_org_int_id varchar(15) NULL,
	prtnr_type_cd varchar(30) NULL,
	pr_addr_id varchar(15) NULL,
	pr_addr_per_id varchar(15) NULL,
	pr_agree_id varchar(15) NULL,
	pr_bill_prfl_id varchar(15) NULL,
	pr_bl_addr_id varchar(15) NULL,
	pr_bl_ou_id varchar(15) NULL,
	pr_bl_per_id varchar(15) NULL,
	pr_competitor_id varchar(15) NULL,
	pr_con_id varchar(15) NULL,
	pr_co_mstr_id varchar(15) NULL,
	pr_crdt_area_id varchar(15) NULL,
	pr_discnt_id varchar(15) NULL,
	pr_eai_sls_area_id varchar(15) NULL,
	pr_emp_rel_id varchar(15) NULL,
	pr_emp_terr_id varchar(15) NULL,
	pr_fulfl_invloc_id varchar(15) NULL,
	pr_geo_id varchar(15) NULL,
	pr_implsvc_vndr_id varchar(15) NULL,
	pr_indust_id varchar(15) NULL,
	pr_logo_id varchar(15) NULL,
	pr_med_proc_id varchar(15) NULL,
	pr_mgr_postn_id varchar(15) NULL,
	pr_mkt_seg_id varchar(15) NULL,
	pr_org_pay_prfl_id varchar(15) NULL,
	pr_org_trgt_mkt_id varchar(15) NULL,
	pr_ou_type_id varchar(15) NULL,
	pr_pay_ou_id varchar(15) NULL,
	pr_phone_id varchar(15) NULL,
	pr_postn_id varchar(15) NULL,
	pr_prfl_id varchar(15) NULL,
	pr_pri_lst_id varchar(15) NULL,
	pr_prod_id varchar(15) NULL,
	pr_prod_ln_id varchar(15) NULL,
	pr_prtnr_ou_id varchar(15) NULL,
	pr_prtnr_prog_id varchar(15) NULL,
	pr_prtnr_tier_id varchar(15) NULL,
	pr_prtnr_type_id varchar(15) NULL,
	pr_ptshp_mktseg_id varchar(15) NULL,
	pr_rep_asgn_type varchar(30) NULL,
	pr_security_id varchar(15) NULL,
	pr_ship_addr_id varchar(15) NULL,
	pr_ship_ou_id varchar(15) NULL,
	pr_ship_per_id varchar(15) NULL,
	pr_situ_id varchar(15) NULL,
	pr_specialty_id varchar(15) NULL,
	pr_spec_id varchar(15) NULL,
	pr_srv_agree_id varchar(15) NULL,
	pr_svc_postn_id varchar(15) NULL,
	pr_syn_id varchar(15) NULL,
	pr_territory_id varchar(15) NULL,
	pr_terr_id varchar(15) NULL,
	pr_vehicle_id varchar(15) NULL,
	ptntl_sls_curcy_cd varchar(20) NULL,
	rating varchar(30) NULL,
	region varchar(50) NULL,
	region_id varchar(15) NULL,
	rel_id varchar(15) NULL,
	rel_name varchar(100) NULL,
	revenue_class_cd varchar(30) NULL,
	rlzd_roi_desc varchar(250) NULL,
	route varchar(30) NULL,
	rte_to_mkt_desc varchar(500) NULL,
	rule_attrib1 varchar(50) NULL,
	rule_attrib2 varchar(50) NULL,
	sales_org_cd varchar(30) NULL,
	sls_dist_cd varchar(30) NULL,
	staff varchar(250) NULL,
	state_abbre_cd varchar(30) NULL,
	status_cd varchar(30) NULL,
	stat_reason_cd varchar(30) NULL,
	survey_type_cd varchar(30) NULL,
	svc_cvrg_stat_cd varchar(30) NULL,
	tax_exempt_num varchar(30) NULL,
	tax_iden_num varchar(50) NULL,
	tax_list_id varchar(15) NULL,
	ticker_sym varchar(10) NULL,
	tlr_intg_msg varchar(250) NULL,
	tlr_intg_ret_cd varchar(30) NULL,
	url varchar(100) NULL,
	vat_regn_num varchar(30) NULL,
	visit_period varchar(30) NULL,
	directions text NULL,
	x_account_id varchar(30) NULL,
	x_cnpj varchar(30) NULL,
	x_login_code varchar(30) NULL,
	x_pr_sync_owner_id varchar(15) NULL,
	source_cd varchar(30) NULL,
	x_contracted_since timestamp NULL,
	x_nickname varchar(100) NULL,
	x_reason_status varchar(30) NULL,
	x_sales_rep varchar(100) NULL,
	x_sanitized_flg bpchar(1) NULL,
	aia_integ1_id varchar(500) NULL,
	bank_code varchar(50) NULL,
	external_host_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	img_src_path varchar(500) NULL,
	od_last_upd_by varchar(125) NULL,
	ondemand_sync_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	pr_labor_rate_id varchar(15) NULL,
	pr_spl_rate_lst_id varchar(15) NULL,
	prtnr_ctgry_cd varchar(30) NULL,
	tax_group_cd varchar(30) NULL,
	thmbnl_imgsrc_path varchar(500) NULL,
	wtr_swift_code varchar(40) NULL,
	x_whatsapp_ph_num varchar(40) NULL,
	x_scheduling_ph_num varchar(100) NULL,
	CONSTRAINT s_org_ext_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_s_org_ext ON landing.s_org_ext USING btree (row_id);


-- landing.s_org_ext_complete definition

-- Drop table

-- DROP TABLE landing.s_org_ext_complete;

CREATE TABLE landing.s_org_ext_complete (
	row_id varchar(15) NOT NULL,
	work_dt timestamp NULL,
	work_num int4 NULL,
	CONSTRAINT s_org_ext_complete_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_s_org_ext_complete ON landing.s_org_ext_complete USING btree (row_id);


-- landing.s_org_ext_x definition

-- Drop table

-- DROP TABLE landing.s_org_ext_x;

CREATE TABLE landing.s_org_ext_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 int4 NULL,
	attrib_15 int4 NULL,
	attrib_16 int4 NULL,
	attrib_17 int4 NULL,
	attrib_18 numeric(22, 7) NULL,
	attrib_19 int4 NULL,
	attrib_20 int4 NULL,
	attrib_21 int4 NULL,
	attrib_22 int4 NULL,
	attrib_23 int4 NULL,
	attrib_24 int4 NULL,
	attrib_25 int4 NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	attrib_54 timestamp NULL,
	attrib_55 timestamp NULL,
	attrib_56 bpchar(1) NULL,
	attrib_57 int4 NULL,
	attrib_58 int4 NULL,
	attrib_59 int4 NULL,
	attrib_60 int4 NULL,
	attrib_61 int4 NULL,
	attrib_62 int4 NULL,
	attrib_63 int4 NULL,
	attrib_64 int4 NULL,
	attrib_65 int4 NULL,
	attrib_73 int4 NULL,
	attrib_74 int4 NULL,
	attrib_75 int4 NULL,
	attrib_76 int4 NULL,
	attrib_77 int4 NULL,
	attrib_78 int4 NULL,
	attrib_79 int4 NULL,
	attrib_80 int4 NULL,
	attrib_81 int4 NULL,
	db_last_upd timestamp NULL,
	fri_1st_close_tm timestamp NULL,
	fri_1st_open_tm timestamp NULL,
	fri_2nd_close_tm timestamp NULL,
	fri_2nd_open_tm timestamp NULL,
	mon_1st_close_tm timestamp NULL,
	mon_1st_open_tm timestamp NULL,
	mon_2nd_close_tm timestamp NULL,
	mon_2nd_open_tm timestamp NULL,
	sat_1st_close_tm timestamp NULL,
	sat_1st_open_tm timestamp NULL,
	sat_2nd_close_tm timestamp NULL,
	sat_2nd_open_tm timestamp NULL,
	sun_1st_close_tm timestamp NULL,
	sun_1st_open_tm timestamp NULL,
	sun_2nd_close_tm timestamp NULL,
	sun_2nd_open_tm timestamp NULL,
	thu_1st_close_tm timestamp NULL,
	thu_1st_open_tm timestamp NULL,
	thu_2nd_close_tm timestamp NULL,
	thu_2nd_open_tm timestamp NULL,
	tue_1st_close_tm timestamp NULL,
	tue_1st_open_tm timestamp NULL,
	tue_2nd_close_tm timestamp NULL,
	tue_2nd_open_tm timestamp NULL,
	wed_1st_close_tm timestamp NULL,
	wed_1st_open_tm timestamp NULL,
	wed_2nd_close_tm timestamp NULL,
	wed_2nd_open_tm timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	attrib_48 varchar(50) NULL,
	attrib_49 varchar(50) NULL,
	attrib_50 varchar(50) NULL,
	attrib_51 varchar(50) NULL,
	attrib_52 varchar(250) NULL,
	attrib_53 varchar(250) NULL,
	attrib_66 varchar(100) NULL,
	attrib_67 varchar(100) NULL,
	attrib_68 varchar(100) NULL,
	attrib_69 varchar(100) NULL,
	attrib_70 varchar(100) NULL,
	attrib_71 varchar(100) NULL,
	attrib_72 varchar(100) NULL,
	db_last_upd_src varchar(50) NULL,
	x_allow_aisa bpchar(1) NULL,
	x_allow_brand_num int4 NULL,
	x_attrib_82 bpchar(1) NULL,
	x_attrib_83 bpchar(1) NULL,
	x_attrib_84 bpchar(1) NULL,
	x_attrib_85 bpchar(1) NULL,
	x_attrib_86 bpchar(1) NULL,
	x_attrib_87 bpchar(1) NULL,
	x_attrib_88 bpchar(1) NULL,
	x_attrib_89 bpchar(1) NULL,
	x_attrib_90 bpchar(1) NULL,
	x_attrib_91 bpchar(1) NULL,
	x_attrib_92 bpchar(1) NULL,
	x_buy_cycle varchar(30) NULL,
	x_car_policy varchar(30) NULL,
	x_change_reason varchar(30) NULL,
	x_flt_acct_type varchar(30) NULL,
	x_flt_org_type varchar(30) NULL,
	x_hd_in_flt int4 NULL,
	x_limit_man bpchar(1) NULL,
	x_next_ten timestamp NULL,
	x_per_ten bpchar(1) NULL,
	x_tot_flt_size int4 NULL,
	x_dealer_code varchar(30) NULL,
	x_flt_ind_type varchar(50) NULL,
	x_social_url varchar(100) NULL,
	x_working_hours varchar(50) NULL,
	x_replaced_row_id varchar(15) NULL,
	x_snt_main_email_addr_flg bpchar(1) NULL,
	x_snt_main_fax_ph_num_flg bpchar(1) NULL,
	x_snt_main_ph_num_flg bpchar(1) NULL,
	x_snt_name_flg bpchar(1) NULL,
	x_snt_url_flg bpchar(1) NULL,
	x_snt_x_cnpj_flg bpchar(1) NULL,
	x_attrib_93 varchar(30) NULL,
	x_api_key varchar(50) NULL,
	x_attrib_99 bpchar(1) NULL,
	x_dms varchar(50) NULL,
	CONSTRAINT s_org_ext_x_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_s_org_ext_x ON landing.s_org_ext_x USING btree (row_id);


-- landing.s_org_ext_xm definition

-- Drop table

-- DROP TABLE landing.s_org_ext_xm;

CREATE TABLE landing.s_org_ext_xm (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 numeric(22, 7) NULL,
	attrib_15 int4 NULL,
	attrib_16 int4 NULL,
	attrib_17 int4 NULL,
	attrib_18 int4 NULL,
	attrib_19 int4 NULL,
	attrib_20 int4 NULL,
	attrib_21 int4 NULL,
	attrib_22 int4 NULL,
	attrib_23 int4 NULL,
	attrib_24 int4 NULL,
	attrib_25 int4 NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	attrib_53 int4 NULL,
	attrib_54 int4 NULL,
	attrib_55 int4 NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	attrib_48 varchar(30) NULL,
	attrib_49 varchar(30) NULL,
	attrib_50 varchar(30) NULL,
	attrib_51 varchar(100) NULL,
	attrib_52 varchar(100) NULL,
	db_last_upd_src varchar(50) NULL,
	scc_id varchar(30) NULL,
	x_dlr_srvc_type varchar(30) NULL
);
CREATE UNIQUE INDEX unique_s_org_ext_xm ON landing.s_org_ext_xm USING btree (row_id);


-- landing.s_org_prtnr definition

-- Drop table

-- DROP TABLE landing.s_org_prtnr;

CREATE TABLE landing.s_org_prtnr (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	flup_con_email_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	flup_emp_act_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	lse_con_email_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	lse_emp_act_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	noact_emp_act_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	ptshp_fee_paid_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	slan_con_email_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	slan_emp_act_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	db_last_upd timestamp NULL,
	flup_num_days_sale int4 NULL,
	lse_num_days_pndg int4 NULL,
	noact_num_days int4 NULL,
	ptshp_end_dt timestamp NULL,
	ptshp_renewal_dt timestamp NULL,
	ptshp_sat_index int4 NULL,
	db_last_upd_src varchar(50) NULL,
	pr_expertise_id varchar(15) NULL,
	pr_prtnr_logo_id varchar(15) NULL,
	pr_prtnr_regn_id varchar(15) NULL,
	ptshp_desc varchar(500) NULL,
	ptshp_growth_strgy varchar(500) NULL,
	ptshp_int_bnft varchar(250) NULL,
	ptshp_prtnr_bnft varchar(250) NULL,
	ptshp_rte_to_mkt varchar(500) NULL,
	ptshp_stage_cd varchar(30) NULL
);
CREATE UNIQUE INDEX unique_s_org_prtnr ON landing.s_org_prtnr USING btree (row_id);


-- landing.s_ou_prtnr_type definition

-- Drop table

-- DROP TABLE landing.s_ou_prtnr_type;

CREATE TABLE landing.s_ou_prtnr_type (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	prtnr_ou_id varchar(15) NOT NULL,
	prtnr_type varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	db_last_upd_src varchar(50) NULL
);
CREATE UNIQUE INDEX unique_s_ou_prtnr_type ON landing.s_ou_prtnr_type USING btree (row_id);


-- landing.s_prod_int definition

-- Drop table

-- DROP TABLE landing.s_prod_int;

CREATE TABLE landing.s_prod_int (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	active_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	add_to_quote_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	apply_ec_rule_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	approval_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	auto_ungroup_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	billable_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	cg_competitor_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	cmpnd_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	commisioned_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	compensatable_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	crt_agreement_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	crt_ast_rec_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	crt_inst_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	design_reg_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	enterprise_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	featured_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	inclsv_elig_rl_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	incl_all_crse_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	leaf_level_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	model_prod_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	"name" varchar(100) NOT NULL,
	need_ph_num_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	orderable_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	postn_bl_prod_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	sales_prod_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	sales_srvc_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	service_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	serv_inst_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	ship_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	target_vrsn_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	tax_subcomp_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	transferable_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	twobarcodes_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	unique_asset_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	ctrl_subs_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	dpndncy_vldtn_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	reqd_service_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	rollup_level int4 NULL DEFAULT 1,
	rollup_trgmkt_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	accrual_rate int4 NULL,
	alc_below_sfty_flg bpchar(1) NULL,
	aloc_assets_flg bpchar(1) NULL,
	aprx_cost_amt int4 NULL,
	apx_cst_exch_dt timestamp NULL,
	auto_allocate_flg bpchar(1) NULL,
	auto_subst_flg bpchar(1) NULL,
	avg_call_cst int4 NULL,
	avg_call_cst_dt timestamp NULL,
	avg_op_life int4 NULL,
	avg_profit int4 NULL,
	capacity int4 NULL,
	cary_cost int4 NULL,
	cary_cost_dt timestamp NULL,
	case_conv_factor int4 NULL,
	case_pack int4 NULL,
	configuration_flg bpchar(1) NULL,
	cutoff_flg bpchar(1) NULL,
	db_last_upd timestamp NULL,
	deliv_interval int4 NULL,
	dest_cost int4 NULL,
	disp_cmpnt_flg bpchar(1) NULL,
	disp_cmpnt_pri_flg bpchar(1) NULL,
	efficiency_rating int4 NULL,
	eff_end_dt timestamp NULL,
	eff_start_dt timestamp NULL,
	exch_dt timestamp NULL,
	exp_lead_days int4 NULL,
	fru_flg bpchar(1) NULL,
	gross_mgn int4 NULL,
	incl_crse_num int4 NULL,
	inventory_flg bpchar(1) NULL,
	item_size int4 NULL,
	load_added int4 NULL,
	lock_flg bpchar(1) NULL,
	lot_active_flg bpchar(1) NULL,
	loy_actual_dist int4 NULL,
	loy_exp_lead_time int4 NULL,
	loy_num_year int4 NULL,
	loy_period_dur int4 NULL,
	loy_sug_points int4 NULL,
	loy_sug_price int4 NULL,
	loy_sug_r_points int4 NULL,
	loy_sug_r_price int4 NULL,
	loy_vchrexp_prddur int4 NULL,
	max_order_units int4 NULL,
	min_order_units int4 NULL,
	model_yr int4 NULL,
	msrp int4 NULL,
	mtbf int4 NULL,
	mttr int4 NULL,
	num_occurrence int4 NULL,
	order_cst int4 NULL,
	order_cst_dt timestamp NULL,
	product_level int4 NULL,
	prod_upd_dt timestamp NULL,
	req_appl_flg bpchar(1) NULL,
	req_referral_flg bpchar(1) NULL,
	reservable_flg bpchar(1) NULL,
	rtrn_defective_flg bpchar(1) NULL,
	rxavpr_exch_dt timestamp NULL,
	rx_avg_price int4 NULL,
	score_num int4 NULL,
	serialized_flg bpchar(1) NULL,
	service_length int4 NULL,
	skip_flg bpchar(1) NULL,
	subscn_dur_day_num int4 NULL,
	taxable_flg bpchar(1) NULL,
	tool_flg bpchar(1) NULL,
	units_bckord int4 NULL,
	units_bckord_as_of timestamp NULL,
	units_invent int4 NULL,
	units_invent_as_of timestamp NULL,
	unit_conv_factor int4 NULL,
	addl_lead_time varchar(30) NULL,
	alias_name varchar(100) NULL,
	apx_cst_curcy_cd varchar(20) NULL,
	asset_ref_expr varchar(100) NULL,
	assoc_level varchar(30) NULL,
	atm_type_cd varchar(30) NULL,
	avgcallcst_curcycd varchar(20) NULL,
	bar_code_num varchar(50) NULL,
	billing_type_cd varchar(30) NULL,
	body_style_cd varchar(30) NULL,
	book_appr_id varchar(15) NULL,
	build varchar(30) NULL,
	cary_cost_curcy_cd varchar(20) NULL,
	category_cd varchar(30) NULL,
	cfg_model_id varchar(15) NULL,
	cg_pr_ctlg_cat_id varchar(15) NULL,
	class_partnum_id varchar(15) NULL,
	"comments" varchar(250) NULL,
	config_rule_file varchar(220) NULL,
	critical_cd varchar(30) NULL,
	cs_path_id varchar(15) NULL,
	curcy_cd varchar(30) NULL,
	data_src varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	def_mod_prod_id varchar(15) NULL,
	desc_text varchar(255) NULL,
	detail_type_cd varchar(30) NULL,
	dflt_procsys_id varchar(15) NULL,
	divn_cd varchar(30) NULL,
	doors_type_cd varchar(30) NULL,
	down_time varchar(30) NULL,
	drive_train_cd varchar(30) NULL,
	engine_type_cd varchar(30) NULL,
	fabric_cd varchar(30) NULL,
	fuel_type_cd varchar(30) NULL,
	gender_cd varchar(30) NULL,
	gtin varchar(20) NULL,
	integration_id varchar(30) NULL,
	intl_bld_lang_cd varchar(30) NULL,
	invntry_integ_id varchar(40) NULL,
	invst_catg_cd varchar(50) NULL,
	invst_obj_cd varchar(30) NULL,
	lead_tm varchar(30) NULL,
	life_cycle_cd varchar(30) NULL,
	loy_dist_uom varchar(30) NULL,
	loy_expr_basis_cd varchar(30) NULL,
	loy_exp_uom varchar(30) NULL,
	loy_fromaprt_cd varchar(30) NULL,
	loy_period_type_cd varchar(30) NULL,
	loy_seq_type_cd varchar(30) NULL,
	loy_series_prefix varchar(15) NULL,
	loy_sug_pttype_id varchar(15) NULL,
	loy_sug_rpttype_id varchar(15) NULL,
	loy_toaprt_cd varchar(30) NULL,
	loy_vch_exp_day_cd varchar(30) NULL,
	loy_vch_exp_mth_cd varchar(30) NULL,
	loy_vexp_pertyp_cd varchar(30) NULL,
	make_cd varchar(30) NULL,
	model varchar(30) NULL,
	model_cd varchar(30) NULL,
	movement_class varchar(30) NULL,
	mtbf_uom_cd varchar(30) NULL,
	mttr_uom_cd varchar(30) NULL,
	net_elmt_type_cd varchar(30) NULL,
	objective_desc varchar(100) NULL,
	onl_pageset_id varchar(15) NULL,
	order_cst_curcy_cd varchar(20) NULL,
	part_num varchar(50) NULL,
	par_prod_int_id varchar(15) NULL,
	paymnt_type_cd varchar(30) NULL,
	permitted_type varchar(250) NULL,
	plan_status varchar(30) NULL,
	pm_dept_postn_id varchar(15) NULL,
	preappr_state_id varchar(15) NULL,
	pref_carrier_cd varchar(30) NULL,
	pref_ship_meth_cd varchar(30) NULL,
	price_type_cd varchar(30) NULL,
	prod_assembly_lvl varchar(50) NULL,
	prod_attrib01_cd varchar(30) NULL,
	prod_attrib02_cd varchar(30) NULL,
	prod_attrib03_cd varchar(30) NULL,
	prod_attrib04_cd varchar(30) NULL,
	prod_catg_cd varchar(30) NULL,
	prod_cd varchar(30) NULL,
	prod_cls_num varchar(50) NULL,
	prod_dist_cd varchar(30) NULL,
	prod_global_uid varchar(50) NULL,
	prod_image_id varchar(15) NULL,
	prod_lcycle_status varchar(50) NULL,
	prod_opt1_mix_id varchar(15) NULL,
	prod_opt2_mix_id varchar(15) NULL,
	prod_option1_id varchar(15) NULL,
	prod_option2_id varchar(15) NULL,
	prod_supply_chain varchar(50) NULL,
	prod_type_cd varchar(30) NULL,
	profit_rank_cd varchar(30) NULL,
	promo_instance_cd varchar(30) NULL,
	promo_type_cd varchar(30) NULL,
	pr_con_id varchar(15) NULL,
	pr_equiv_prod_id varchar(15) NULL,
	pr_erng_id varchar(15) NULL,
	pr_fulfl_invloc_id varchar(15) NULL,
	pr_indust_id varchar(15) NULL,
	pr_postn_id varchar(15) NULL,
	pr_prod_ln_id varchar(15) NULL,
	pr_season_id varchar(15) NULL,
	pr_ship_carprio_id varchar(15) NULL,
	pr_src_id varchar(15) NULL,
	pr_trgt_mkt_seg_id varchar(15) NULL,
	quality_cd varchar(30) NULL,
	reason_txt varchar(250) NULL,
	reference_type_cd varchar(30) NULL,
	ref_number_1 varchar(30) NULL,
	ref_number_2 varchar(30) NULL,
	ref_number_3 varchar(30) NULL,
	ref_number_4 varchar(30) NULL,
	ref_number_5 varchar(30) NULL,
	region_id varchar(15) NULL,
	req_data_id varchar(15) NULL,
	risk varchar(250) NULL,
	root_prod_id varchar(15) NULL,
	rule_attrib1 varchar(50) NULL,
	rule_attrib2 varchar(50) NULL,
	rxavpr_curcy_cd varchar(20) NULL,
	schedule_num_cd varchar(30) NULL,
	seq_cd varchar(30) NULL,
	service_terms varchar(255) NULL,
	serv_length_uom_cd varchar(30) NULL,
	silhouette_cd varchar(30) NULL,
	status_cd varchar(30) NULL,
	strategy varchar(250) NULL,
	strength varchar(30) NULL,
	sub_type varchar(30) NULL,
	sub_type_cd varchar(30) NULL,
	tgt_cust_type_cd varchar(30) NULL,
	tgt_region_cd varchar(30) NULL,
	thmbnl_image_id varchar(15) NULL,
	transmission_cd varchar(30) NULL,
	trgt_mkt_id varchar(15) NULL,
	trim_cd varchar(30) NULL,
	"type" varchar(30) NULL,
	uom_cd varchar(30) NULL,
	valtn_sys_id varchar(15) NULL,
	value_class varchar(30) NULL,
	vendr_ou_id varchar(15) NULL,
	vendr_part_num varchar(50) NULL,
	"version" varchar(30) NULL,
	xa_class_id varchar(15) NULL,
	aia_integ_id varchar(150) NULL,
	apply_mem_comp_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	bil_on_fst_usg_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	composn_type_cd varchar(30) NULL,
	desc_text_long varchar(1999) NULL,
	disp_invoice_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	dyn_discnt_meth_cd varchar(30) NULL,
	fulflmnt_crit_cd varchar(30) NULL,
	fulflmnt_item_code varchar(100) NULL,
	img_src_path varchar(500) NULL,
	loy_vch_num_usage int4 NULL,
	loy_vch_st_day_cd varchar(30) NULL,
	loy_vch_st_mth_cd varchar(30) NULL,
	ondemand_sync_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	pg_notify_accnt_cd varchar(30) NULL,
	pg_owner_type_cd varchar(30) NULL,
	pms_end_dt timestamp NULL,
	pms_start_dt timestamp NULL,
	pri_commit_type_cd varchar(30) NULL,
	pricing_text varchar(1999) NULL,
	prod_msg_id varchar(15) NULL,
	rslv_ambiguity_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	spl_rate_max_val int4 NULL,
	spl_rt_lst_type_cd varchar(30) NULL,
	terms_cond_text varchar(1999) NULL,
	thmbnl_imgsrc_path varchar(500) NULL,
	tnt_filter_type_cd varchar(30) NULL
);
CREATE INDEX s_prod_int_name_idx ON landing.s_prod_int USING btree (name);
CREATE UNIQUE INDEX unique_s_prod_int ON landing.s_prod_int USING btree (row_id);


-- landing.s_prod_int_complete definition

-- Drop table

-- DROP TABLE landing.s_prod_int_complete;

CREATE TABLE landing.s_prod_int_complete (
	row_id varchar(15) NOT NULL,
	work_dt timestamp NULL,
	work_num int4 NULL,
	CONSTRAINT s_prod_int_complete_pk PRIMARY KEY (row_id)
);
CREATE UNIQUE INDEX unique_s_prod_int_complete ON landing.s_prod_int_complete USING btree (row_id);


-- landing.s_prod_int_x definition

-- Drop table

-- DROP TABLE landing.s_prod_int_x;

CREATE TABLE landing.s_prod_int_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 int4 NULL,
	attrib_15 int4 NULL,
	attrib_16 int4 NULL,
	attrib_17 int4 NULL,
	attrib_18 int4 NULL,
	attrib_19 int4 NULL,
	attrib_20 int4 NULL,
	attrib_21 int4 NULL,
	attrib_22 int4 NULL,
	attrib_23 int4 NULL,
	attrib_24 int4 NULL,
	attrib_25 int4 NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	attrib_48 int4 NULL,
	attrib_49 int4 NULL,
	attrib_50 bpchar(1) NULL,
	attrib_54 timestamp NULL,
	attrib_55 timestamp NULL,
	attrib_56 timestamp NULL,
	attrib_57 int4 NULL,
	attrib_58 int4 NULL,
	attrib_59 int4 NULL,
	attrib_60 int4 NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	attrib_51 varchar(250) NULL,
	attrib_52 varchar(250) NULL,
	attrib_53 varchar(250) NULL,
	db_last_upd_src varchar(50) NULL,
	x_attrib_61 varchar(2000) NULL
);
CREATE UNIQUE INDEX unique_s_prod_int_x ON landing.s_prod_int_x USING btree (row_id);


-- landing.s_sr_att definition

-- Drop table

-- DROP TABLE landing.s_sr_att;

CREATE TABLE landing.s_sr_att (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	file_auto_upd_flg bpchar(1) NOT NULL,
	file_defer_flg bpchar(1) NOT NULL,
	file_dock_req_flg bpchar(1) NOT NULL,
	file_dock_stat_flg bpchar(1) NOT NULL,
	file_name varchar(200) NOT NULL,
	db_last_upd timestamp NULL,
	file_date timestamp NULL,
	file_size int4 NULL,
	"comments" varchar(2000) NULL,
	db_last_upd_src varchar(50) NULL,
	file_ext varchar(10) NULL,
	file_rev_num varchar(15) NULL,
	file_src_path varchar(255) NULL,
	file_src_type varchar(30) NULL,
	publish_cd varchar(30) NULL,
	x_dp_if_dt timestamp NULL,
	x_dp_if_filename varchar(200) NULL,
	x_dp_if_flg varchar(1) NULL
);
CREATE UNIQUE INDEX unique_s_sr_att ON landing.s_sr_att USING btree (row_id);


-- landing.s_src definition

-- Drop table

-- DROP TABLE landing.s_src;

CREATE TABLE landing.s_src (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	active_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	all_accnt_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	appl_wavelag_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	auto_est_cnts_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	check_fst_stg_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	clean_file_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	conprsp_dirty_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	con_genrtd_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	copy_to_occur_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	enfrc_appr_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	excl_stg_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	freeze_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	genrt_src_cd_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	mktg_tmpl_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	mutl_exclusive_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	"name" varchar(100) NOT NULL,
	nonexec_camp_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	owner_edit_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	partner_edit_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	pct_alloc_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	phase_enabled_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	publish_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	read_only_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	recurring_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	rpt_acrossload_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	rpt_withinload_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	rte_contacts_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	rte_prsp_cons_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	sebl_db_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	src_num varchar(30) NOT NULL DEFAULT 'x'::character varying,
	standalone_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	stg_funnel_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	sub_type varchar(30) NOT NULL,
	test_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	track_send_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	trigger_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	use_ext_file_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	current_target_num int4 NULL DEFAULT 0,
	revn_goal_curcy_cd varchar(20) NULL DEFAULT 'USD'::character varying,
	actl_amt_exch_dt timestamp NULL,
	actl_conv_rate int4 NULL,
	actl_cost_amt int4 NULL,
	actl_fixed_cost int4 NULL,
	actl_num_contacts int4 NULL,
	actl_qty int4 NULL,
	actl_resp_rate int4 NULL,
	actl_revn int4 NULL,
	actl_revn_amt int4 NULL,
	actl_revn_dt timestamp NULL,
	actl_roi_amt int4 NULL,
	actl_sale_price int4 NULL,
	actl_unit_contr int4 NULL,
	actl_var_i_cost int4 NULL,
	actl_var_o_cost int4 NULL,
	actual_upd_dt timestamp NULL,
	adjusted_cost int4 NULL,
	asgn_dt timestamp NULL,
	asgn_usr_excld_flg bpchar(1) NULL,
	bdgt_alloc_pct int4 NULL,
	bdgt_amt int4 NULL,
	calc_sub_cost int4 NULL,
	camp_alloc_limit int4 NULL,
	consume_end_dt timestamp NULL,
	consume_start_dt timestamp NULL,
	cost_exch_dt timestamp NULL,
	coupon_drop_flg bpchar(1) NULL,
	db_last_upd timestamp NULL,
	desired_num_cons int4 NULL,
	desired_pct_of_seg int4 NULL,
	display_flg bpchar(1) NULL,
	dnis_replay_ts timestamp NULL,
	dt_lag int4 NULL,
	est_amt_exch_dt timestamp NULL,
	fcst_sale_price int4 NULL,
	feature_flg bpchar(1) NULL,
	launched_ts timestamp NULL,
	num_contacts int4 NULL,
	nxtschd_launch_ts timestamp NULL,
	pct_coded_fcst int4 NULL,
	pct_coded_resp int4 NULL,
	predict_conv_rate int4 NULL,
	predict_cost_amt int4 NULL,
	predict_fixed_cost int4 NULL,
	predict_num_cons int4 NULL,
	predict_resp_rate int4 NULL,
	predict_revn_amt int4 NULL,
	predict_roi_amt int4 NULL,
	predict_sale_price int4 NULL,
	predict_unit_contr int4 NULL,
	predict_var_i_cost int4 NULL,
	predict_var_o_cost int4 NULL,
	prog_end_dt timestamp NULL,
	prog_start_dt timestamp NULL,
	pr_rep_dnrm_flg bpchar(1) NULL,
	pr_rep_manl_flg bpchar(1) NULL,
	pr_rep_sys_flg bpchar(1) NULL,
	repeat_freq int4 NULL,
	repeat_until int4 NULL,
	requested_bdgt_amt int4 NULL,
	revn_goal int4 NULL,
	revn_goal_dt timestamp NULL,
	revn_goal_tgt_dt timestamp NULL,
	rev_num int4 NULL,
	ship_end_dt timestamp NULL,
	ship_start_dt timestamp NULL,
	spec_advert_flg bpchar(1) NULL,
	spec_package_flg bpchar(1) NULL,
	submitted_dt timestamp NULL,
	target_roi_amt int4 NULL,
	tgt_calls_per_day int4 NULL,
	tgt_total_calls int4 NULL,
	tmp_pri_rdx_flg bpchar(1) NULL,
	tmp_pri_rdx_pct int4 NULL,
	total_cost int4 NULL,
	total_fund_amt int4 NULL,
	trgt_qty int4 NULL,
	actl_revn_curcy_cd varchar(20) NULL,
	advert_desc_text varchar(255) NULL,
	amt_curcy_cd varchar(20) NULL,
	asgn_rule_grp_id varchar(15) NULL,
	booking_id varchar(15) NULL,
	budget_period_id varchar(15) NULL,
	bus_plan_id varchar(15) NULL,
	camp_call_lst_id varchar(15) NULL,
	camp_cat_cd varchar(30) NULL,
	camp_type_cd varchar(30) NULL,
	chmpintv_id varchar(15) NULL,
	collab_desc_text varchar(250) NULL,
	"comments" varchar(250) NULL,
	cost_curcy_cd varchar(20) NULL,
	crse_id varchar(15) NULL,
	ctlg_cat_id varchar(15) NULL,
	cur_wf_process_id varchar(15) NULL,
	cust_trgt_meth_cd varchar(30) NULL,
	cust_trgt_type_cd varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	default_opty_name varchar(100) NULL,
	desc_text varchar(255) NULL,
	dflt_owner_bu_id varchar(15) NULL,
	dflt_owner_pstn_id varchar(15) NULL,
	dnis_leader varchar(50) NULL,
	dnis_number varchar(40) NULL,
	dnis_passcode varchar(20) NULL,
	dnis_replay_num varchar(20) NULL,
	dt_lag_units_cd varchar(30) NULL,
	eai_lst_fmt_id varchar(15) NULL,
	escl_rule_id varchar(15) NULL,
	execution_stat_cd varchar(30) NULL,
	exec_appr_stat_cd varchar(30) NULL,
	filter_id varchar(15) NULL,
	fixed_cost_type_cd varchar(30) NULL,
	flowchart_cnctr varchar(1999) NULL,
	funnel_stage_id varchar(15) NULL,
	indir_accnt_id varchar(15) NULL,
	integration_id varchar(30) NULL,
	int_ou_id varchar(15) NULL,
	layout varchar(2000) NULL,
	load_behavior_cd varchar(30) NULL,
	loc varchar(100) NULL,
	loy_prog_id varchar(15) NULL,
	media_subtype_cd varchar(30) NULL,
	media_type_cd varchar(30) NULL,
	mktg_appr_stat_cd varchar(30) NULL,
	mktg_bdgt_req_id varchar(15) NULL,
	mktg_plan_id varchar(15) NULL,
	mktg_tmpl_id varchar(15) NULL,
	objective varchar(2000) NULL,
	org_prod_id varchar(15) NULL,
	oth_cost_desc varchar(250) NULL,
	ownership_type_cd varchar(30) NULL,
	package_desc_text varchar(255) NULL,
	par_src_id varchar(15) NULL,
	period_id varchar(15) NULL,
	plan_type_cd varchar(30) NULL,
	pref_lang_id varchar(15) NULL,
	pref_uom_cd varchar(30) NULL,
	pre_load_tsk_wf_id varchar(15) NULL,
	priority_cd varchar(30) NULL,
	prod_id varchar(15) NULL,
	promo_hist_tbl_id varchar(15) NULL,
	promo_name varchar(100) NULL,
	promo_num varchar(30) NULL,
	promo_pri_lst_id varchar(15) NULL,
	pr_accnt_id varchar(15) NULL,
	pr_call_lst_id varchar(15) NULL,
	pr_cs_path_id varchar(15) NULL,
	pr_dmnd_crt_prg_id varchar(15) NULL,
	pr_d_note_id varchar(15) NULL,
	pr_lst_fmt_id varchar(15) NULL,
	pr_mdf_id varchar(15) NULL,
	pr_mktg_offr_id varchar(15) NULL,
	pr_opty_id varchar(15) NULL,
	pr_plan_item_id varchar(15) NULL,
	pr_postn_id varchar(15) NULL,
	pr_prod_int_id varchar(15) NULL,
	pr_prod_ln_id varchar(15) NULL,
	pr_prtnr_id varchar(15) NULL,
	pr_region_id varchar(15) NULL,
	pr_script_note_id varchar(15) NULL,
	pr_terr_id varchar(15) NULL,
	pr_track_evt_id varchar(15) NULL,
	pr_trgt_indust_id varchar(15) NULL,
	pst_lnch_tsk_wf_id varchar(15) NULL,
	pst_load_tsk_wf_id varchar(15) NULL,
	purpose varchar(2000) NULL,
	region_cd varchar(30) NULL,
	region_id varchar(15) NULL,
	repeat_type_cd varchar(30) NULL,
	response_type varchar(30) NULL,
	smplng_sort_by_fld varchar(75) NULL,
	smplng_type_cd varchar(30) NULL,
	sponsor_emp_id varchar(15) NULL,
	src_cd varchar(30) NULL,
	src_cd_fmt_id varchar(15) NULL,
	src_cd_max_num varchar(10) NULL,
	srtfam_id varchar(15) NULL,
	srtfam_lvl_id varchar(15) NULL,
	status_cd varchar(30) NULL,
	stat_cd varchar(30) NULL,
	submitted_by varchar(15) NULL,
	suppressn_list_cd varchar(30) NULL,
	target varchar(2000) NULL,
	tmpl_id varchar(15) NULL,
	tmp_calc_text varchar(250) NULL,
	trgt_mkt_seg_id varchar(15) NULL,
	trng_status_cd varchar(30) NULL,
	ult_par_src_id varchar(15) NULL,
	user_key_tbl_id varchar(15) NULL,
	x_channel varchar(30) NULL,
	x_city varchar(30) NULL,
	x_cultural varchar(30) NULL,
	x_lead_source varchar(30) NULL,
	x_model varchar(30) NULL,
	x_state varchar(30) NULL,
	cmp_launch_run_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	cmpgn_load_run_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	highlvl_pln_cat_id varchar(15) NULL,
	img_src_path varchar(500) NULL,
	mutual_excl_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	save_email_dir varchar(500) NULL,
	save_email_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	thmbnl_imgsrc_path varchar(500) NULL,
	wrnty_labop_src_cd varchar(30) NULL
);
CREATE INDEX s_src_name_idx ON landing.s_src USING btree (name);
CREATE UNIQUE INDEX unique_s_src ON landing.s_src USING btree (row_id);


-- landing.s_srv_req definition

-- Drop table

-- DROP TABLE landing.s_srv_req;

CREATE TABLE landing.s_srv_req (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	alert_user_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	approved_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	appt_req_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	billable_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	bu_id varchar(15) NOT NULL DEFAULT '0-R9NH'::character varying,
	callback_req_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	comp_und_wrnty_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	prod_und_wrnty_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	row_status varchar(10) NOT NULL DEFAULT 'Y'::character varying,
	srv_fee_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	sr_num varchar(64) NOT NULL,
	template_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	und_mfg_wrnty_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	asgn_manl_flg bpchar(1) NULL DEFAULT 'Y'::bpchar,
	dock_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	actl_resolved_ts timestamp NULL,
	actl_resp_ts timestamp NULL,
	act_close_dt timestamp NULL,
	act_open_dt timestamp NULL,
	asgn_dnrm_flg bpchar(1) NULL,
	asgn_dt timestamp NULL,
	asgn_sys_flg bpchar(1) NULL,
	asgn_usr_excld_flg bpchar(1) NULL,
	cem_due_dt timestamp NULL,
	cem_plan_end_dt timestamp NULL,
	cem_plan_start_dt timestamp NULL,
	cem_total_time int4 NULL,
	comm_need_flg bpchar(1) NULL,
	db_last_upd timestamp NULL,
	doc_recv_flg bpchar(1) NULL,
	doc_reqd_flg bpchar(1) NULL,
	exp_close_dt timestamp NULL,
	init_commit_ts timestamp NULL,
	notify_dt timestamp NULL,
	odomtr_rdng numeric(22, 7) NULL,
	post_mortem_rvw_dt timestamp NULL,
	reopened_ts timestamp NULL,
	srv_fee int4 NULL,
	srv_fee_dt timestamp NULL,
	sr_created_dt timestamp NULL,
	sr_escl_ts timestamp NULL,
	sr_stat_dt timestamp NULL,
	suprv_rvw_flg bpchar(1) NULL,
	wrnty_last_upd_dt timestamp NULL,
	accnt_con_id varchar(15) NULL,
	accnt_txn_id varchar(15) NULL,
	act_id varchar(15) NULL,
	agent_comments varchar(250) NULL,
	agree_id varchar(15) NULL,
	alt_contact_name varchar(100) NULL,
	alt_con_email varchar(350) NULL,
	alt_con_ph_num varchar(40) NULL,
	asset_id varchar(15) NULL,
	asset_reg_id varchar(15) NULL,
	based_on_sr_id varchar(15) NULL,
	best_call_tm varchar(30) NULL,
	billacct_id varchar(15) NULL,
	branch_id varchar(15) NULL,
	case_id varchar(15) NULL,
	cem_time_uom_cd varchar(30) NULL,
	comm_desc varchar(100) NULL,
	comm_id varchar(15) NULL,
	comm_method_cd varchar(30) NULL,
	con_prdint_id varchar(15) NULL,
	cst_con_id varchar(15) NULL,
	cst_ou_id varchar(15) NULL,
	cst_satisfy_cd varchar(30) NULL,
	cust_con_email varchar(350) NULL,
	cust_con_ph_num varchar(40) NULL,
	db_last_upd_src varchar(50) NULL,
	disease_id varchar(15) NULL,
	entlmnt_mtrc_id varchar(15) NULL,
	fee_center_id varchar(15) NULL,
	frm_container_id varchar(15) NULL,
	incident_id varchar(15) NULL,
	init_cust_sev_cd varchar(30) NULL,
	init_sev_cd varchar(30) NULL,
	insclm_id varchar(15) NULL,
	ins_product varchar(50) NULL,
	ins_rec_type varchar(30) NULL,
	ins_request_by varchar(50) NULL,
	integration_id varchar(30) NULL,
	lot_num varchar(100) NULL,
	new_sec_answr varchar(50) NULL,
	new_sec_quest_cd varchar(30) NULL,
	odomtr_uom_cd varchar(30) NULL,
	opty_id varchar(15) NULL,
	org_group_id varchar(15) NULL,
	org_prdint_id varchar(15) NULL,
	ou_addr_id varchar(15) NULL,
	override_id varchar(15) NULL,
	owner_emp_id varchar(15) NULL,
	owner_ou_id varchar(15) NULL,
	par_sr_id varchar(15) NULL,
	per_addr_id varchar(15) NULL,
	pm_action_id varchar(15) NULL,
	post_mortem_rvw_by varchar(15) NULL,
	prdint_id varchar(15) NULL,
	pri_lst_id varchar(15) NULL,
	prod_ln_fee_id varchar(15) NULL,
	proj_id varchar(15) NULL,
	pr_con_id varchar(15) NULL,
	pr_con_org_id varchar(15) NULL,
	pr_med_dgnsis_id varchar(15) NULL,
	pr_med_proc_id varchar(15) NULL,
	pr_par_sr_id varchar(15) NULL,
	pr_prd_cmplnt_id varchar(15) NULL,
	pr_profile_id varchar(15) NULL,
	pr_survey_id varchar(15) NULL,
	pr_symptom_cd varchar(30) NULL,
	publish_cd varchar(30) NULL,
	rate_lst_id varchar(15) NULL,
	reason_cd varchar(30) NULL,
	recommendation_cd varchar(30) NULL,
	resolution_cd varchar(30) NULL,
	root_cause_cd varchar(30) NULL,
	rtng_cd varchar(30) NULL,
	rtng_dlr_id varchar(15) NULL,
	smart_issue_id varchar(64) NULL,
	source_typ_cd varchar(30) NULL,
	sp_asset_id varchar(15) NULL,
	sp_prdint_id varchar(15) NULL,
	srv_fee_curcy_cd varchar(20) NULL,
	srv_fee_reason_cd varchar(30) NULL,
	srv_prov_ou_id varchar(15) NULL,
	srv_regn_id varchar(15) NULL,
	sr_area varchar(30) NULL,
	sr_category_cd varchar(30) NULL,
	sr_cat_type_cd varchar(30) NULL,
	sr_created_by varchar(15) NULL,
	sr_cst_num varchar(64) NULL,
	sr_database varchar(30) NULL,
	sr_impact_cd varchar(30) NULL,
	sr_os varchar(30) NULL,
	sr_prio_cd varchar(30) NULL,
	sr_prod_version varchar(30) NULL,
	sr_reproduce varchar(30) NULL,
	sr_sev_cd varchar(30) NULL,
	sr_stat_id varchar(30) NULL,
	sr_subtype_cd varchar(30) NULL,
	sr_sub_area varchar(30) NULL,
	sr_sub_stat_id varchar(30) NULL,
	sr_title varchar(1000) NULL,
	sr_type_cd varchar(30) NULL,
	sr_urgency_cd varchar(30) NULL,
	target_con_id varchar(15) NULL,
	temp_ph_num varchar(40) NULL,
	to_container_id varchar(15) NULL,
	to_teller_id varchar(15) NULL,
	tt_type_cd varchar(30) NULL,
	type_cd varchar(30) NULL,
	x_access_req_flg bpchar(1) NULL,
	x_allow_dlr_con_flg bpchar(1) NULL,
	x_appont_req_flg bpchar(1) NULL,
	x_budgt_req_flg bpchar(1) NULL,
	x_car_req_flg bpchar(1) NULL,
	x_crnnt_car_ownrshp varchar(30) NULL,
	x_crrnt_car varchar(100) NULL,
	x_crrnt_car_brnd varchar(100) NULL,
	x_crrnt_car_mdl varchar(100) NULL,
	x_crrnt_car_oltype varchar(30) NULL,
	x_crrnt_car_sltype varchar(30) NULL,
	x_ctgry_code varchar(50) NULL,
	x_ctgry_name varchar(50) NULL,
	x_dealer_id_hmuk varchar(15) NULL,
	x_dlr_cnsltnt varchar(100) NULL,
	x_dlr_comments varchar(250) NULL,
	x_dp_int_dt timestamp NULL,
	x_dp_int_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	x_drv_experience varchar(30) NULL,
	x_fleet_car1 varchar(50) NULL,
	x_fleet_car2 varchar(50) NULL,
	x_fleet_car3 varchar(50) NULL,
	x_hq_int_dt timestamp NULL,
	x_hq_int_flg bpchar(1) NULL,
	x_info_source varchar(30) NULL,
	x_intnd_rpl_dt varchar(30) NULL,
	x_intndrpl_m varchar(30) NULL,
	x_intndrpl_y varchar(30) NULL,
	x_intrst_vhcl varchar(100) NULL,
	x_log_id varchar(15) NULL,
	x_magazine_subscrip_type varchar(30) NULL,
	x_method_detail varchar(250) NULL,
	x_mkt_req_flg bpchar(1) NULL,
	x_newsletter_subscrip_type varchar(30) NULL,
	x_open_comp int4 NULL,
	x_prchs_enddt timestamp NULL,
	x_prchs_startdt timestamp NULL,
	x_reject_desc varchar(100) NULL,
	x_req_mdl varchar(100) NULL,
	x_req_vhcl varchar(100) NULL,
	x_s_srv_req varchar(100) NULL,
	x_segment varchar(30) NULL,
	x_src_id varchar(15) NULL,
	x_sub_source varchar(50) NULL,
	x_subctgry_code varchar(50) NULL,
	x_subctgry_name varchar(50) NULL,
	x_subsch varchar(30) NULL,
	x_test_drv_tm varchar(30) NULL,
	x_testdrv_dt timestamp NULL,
	x_type_code varchar(50) NULL,
	x_type_name varchar(50) NULL,
	x_usedcar_br varchar(100) NULL,
	x_usedcar_md varchar(100) NULL,
	x_vhcl_yr varchar(30) NULL,
	x_call_id varchar(50) NULL,
	x_accessory varchar(255) NULL,
	x_unique_key varchar(500) NULL,
	x_rsa_request_id varchar(15) NULL,
	x_viplist_campaign varchar(60) NULL,
	x_viplist_campaign_id varchar(15) NULL,
	x_viplist_content varchar(60) NULL,
	x_viplist_medium varchar(60) NULL,
	x_viplist_src_tag varchar(60) NULL,
	x_viplist_stock varchar(30) NULL,
	desc_text varchar(2000) NULL,
	x_pne_flg bpchar(1) NULL,
	job_ref_num varchar(15) NULL,
	job_tot_order_num int4 NULL,
	job_type_cd varchar(30) NULL,
	sm_data_id varchar(15) NULL,
	symptom_dscvry_ts timestamp NULL,
	x_order_num varchar(50) NULL,
	x_camp_id varchar(30) NULL,
	x_form varchar(30) NULL,
	x_usedcar_chassi varchar(50) NULL,
	x_usedcar_color varchar(30) NULL,
	x_usedcar_km varchar(30) NULL,
	x_usedcar_maxprice varchar(30) NULL,
	x_usedcar_medprice varchar(30) NULL,
	x_usedcar_minprice varchar(30) NULL,
	x_usedcar_plate varchar(30) NULL,
	x_usedcar_version varchar(100) NULL,
	x_usedcar_year varchar(30) NULL
);
CREATE UNIQUE INDEX unique_s_srv_req ON landing.s_srv_req USING btree (row_id);


-- landing.s_srv_req_x definition

-- Drop table

-- DROP TABLE landing.s_srv_req_x;

CREATE TABLE landing.s_srv_req_x (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 int4 NULL,
	attrib_15 int4 NULL,
	attrib_16 int4 NULL,
	attrib_17 int4 NULL,
	attrib_18 int4 NULL,
	attrib_19 int4 NULL,
	attrib_20 int4 NULL,
	attrib_21 int4 NULL,
	attrib_22 int4 NULL,
	attrib_23 int4 NULL,
	attrib_24 int4 NULL,
	attrib_25 int4 NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(100) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(30) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	db_last_upd_src varchar(50) NULL,
	x_attrib_48 varchar(30) NULL,
	x_attrib_49 varchar(100) NULL,
	x_attrib_50 varchar(100) NULL,
	x_attrib_51 varchar(100) NULL,
	x_attrib_52 varchar(100) NULL,
	x_attrib_53 varchar(100) NULL,
	x_ext_draft_dt timestamp NULL,
	x_ext_draft_flg bpchar(1) NULL DEFAULT 'N'::bpchar,
	x_ext_obd_dt timestamp NULL,
	x_ext_obd_flag bpchar(1) NULL,
	x_anonymous_flg bpchar(1) NULL,
	x_causing_area varchar(30) NULL,
	x_closed_by varchar(15) NULL,
	x_level_4 varchar(30) NULL,
	x_quote_desc varchar(2000) NULL,
	x_solution_customer varchar(100) NULL,
	x_car_color varchar(100) NULL,
	x_car_color_price varchar(100) NULL,
	x_car_engtransm varchar(100) NULL,
	x_car_final_price varchar(100) NULL,
	x_car_repl_intent varchar(100) NULL,
	x_car_version varchar(100) NULL,
	x_car_version_price varchar(100) NULL,
	x_quality_compliant_email_sent bpchar(1) NULL DEFAULT 'N'::bpchar,
	x_sr_comment varchar(2000) NULL,
	x_attrib_54 bpchar(1) NULL,
	x_additional_comments varchar(500) NULL,
	x_causing_person varchar(30) NULL,
	x_cust_rep varchar(100) NULL,
	x_cust_rep_rel varchar(30) NULL,
	x_diagnosis_difficulty bpchar(1) NULL,
	x_diagnosis_pending bpchar(1) NULL,
	x_dlr_description varchar(500) NULL,
	x_dlr_fup varchar(500) NULL,
	x_dlr_pending varchar(500) NULL,
	x_dlr_retraction bpchar(1) NULL,
	x_dlr_reversal varchar(500) NULL,
	x_hotline_flg bpchar(1) NULL,
	x_hotline_num varchar(30) NULL,
	x_hotline_open_dt timestamp NULL,
	x_purchase_proposal_num varchar(30) NULL,
	x_pwa_flg bpchar(1) NULL,
	x_pwa_num varchar(30) NULL,
	x_pwa_open_dt timestamp NULL,
	x_recurrence bpchar(1) NULL,
	x_recurrence_num int4 NULL,
	x_vehicle_delivery_dt timestamp NULL,
	x_vehicle_delivery_flg bpchar(1) NULL,
	x_opv_down_paymnt int4 NULL,
	x_opv_installments_amt int4 NULL,
	x_opv_loan_type varchar(50) NULL,
	x_opv_usedcar_paymnt bpchar(1) NULL,
	x_opv_wants_loan bpchar(1) NULL,
	x_dlr_temperature bpchar(1) NULL,
	x_dlr_dealer_portal_sent_dt timestamp NULL,
	x_dlr_webmotors_sent_dt timestamp NULL,
	x_dlr_temperature_receive_dt timestamp NULL,
	x_dlr_webmotors_dv_flg bpchar(1) NULL,
	x_sales_dlr varchar(30) NULL,
	x_vin_sales_dt timestamp NULL,
	x_lead_receive_dt timestamp NULL,
	x_sched_dt timestamp NULL,
	x_sched_type varchar(30) NULL,
	x_opv_date_paymnt timestamp NULL,
	x_opv_method_paymnt varchar(22) NULL,
	x_opv_reserv_amount varchar(22) NULL,
	x_opv_stat_paymnt varchar(22) NULL
);
CREATE UNIQUE INDEX unique_s_srv_req_x ON landing.s_srv_req_x USING btree (row_id);


-- landing.s_srv_req_xm definition

-- Drop table

-- DROP TABLE landing.s_srv_req_xm;

CREATE TABLE landing.s_srv_req_xm (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" varchar(30) NOT NULL,
	attrib_08 bpchar(1) NULL,
	attrib_09 bpchar(1) NULL,
	attrib_10 bpchar(1) NULL,
	attrib_11 bpchar(1) NULL,
	attrib_12 timestamp NULL,
	attrib_13 timestamp NULL,
	attrib_14 numeric(22, 7) NULL,
	attrib_15 numeric(22, 7) NULL,
	attrib_16 numeric(22, 7) NULL,
	attrib_17 numeric(22, 7) NULL,
	attrib_18 numeric(22, 7) NULL,
	attrib_19 numeric(22, 7) NULL,
	attrib_20 numeric(22, 7) NULL,
	attrib_21 numeric(22, 7) NULL,
	attrib_22 numeric(22, 7) NULL,
	attrib_23 numeric(22, 7) NULL,
	attrib_24 numeric(22, 7) NULL,
	attrib_25 numeric(22, 7) NULL,
	attrib_26 timestamp NULL,
	attrib_27 timestamp NULL,
	attrib_28 timestamp NULL,
	attrib_29 timestamp NULL,
	attrib_30 timestamp NULL,
	attrib_31 timestamp NULL,
	attrib_32 timestamp NULL,
	attrib_33 timestamp NULL,
	db_last_upd timestamp NULL,
	attrib_01 varchar(255) NULL,
	attrib_02 varchar(100) NULL,
	attrib_03 varchar(100) NULL,
	attrib_04 varchar(30) NULL,
	attrib_05 varchar(30) NULL,
	attrib_06 varchar(30) NULL,
	attrib_07 varchar(30) NULL,
	attrib_34 varchar(50) NULL,
	attrib_35 varchar(50) NULL,
	attrib_36 varchar(50) NULL,
	attrib_37 varchar(50) NULL,
	attrib_38 varchar(50) NULL,
	attrib_39 varchar(50) NULL,
	attrib_40 varchar(50) NULL,
	attrib_41 varchar(50) NULL,
	attrib_42 varchar(50) NULL,
	attrib_43 varchar(50) NULL,
	attrib_44 varchar(100) NULL,
	attrib_45 varchar(100) NULL,
	attrib_46 varchar(100) NULL,
	attrib_47 varchar(255) NULL,
	db_last_upd_src varchar(50) NULL,
	x_attrib_48 varchar(255) NULL,
	x_attrib_49 varchar(100) NULL,
	x_attrib_50 varchar(2000) NULL,
	x_attrib_51 varchar(2000) NULL,
	x_business_courtesy varchar(30) NULL
);
CREATE UNIQUE INDEX unique_s_srv_req_xm ON landing.s_srv_req_xm USING btree (row_id);


-- landing.s_user definition

-- Drop table

-- DROP TABLE landing.s_user;

CREATE TABLE landing.s_user (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	par_row_id varchar(15) NOT NULL,
	integ_user_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	login varchar(50) NOT NULL,
	user_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	trng_dl_admin_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	ams_last_upd_dt timestamp NULL,
	ams_pwd_expr_dt timestamp NULL,
	days_comp_trng int4 NULL,
	days_inv_audit int4 NULL,
	days_overdue_ack int4 NULL,
	days_report_loss int4 NULL,
	days_smpl_warning int4 NULL,
	days_transfer_in int4 NULL,
	days_trsfr_discr int4 NULL,
	day_overdue_invchk int4 NULL,
	db_last_upd timestamp NULL,
	last_login_ts timestamp NULL,
	last_uncompress_dt timestamp NULL,
	last_upd_amspwd_dt timestamp NULL,
	max_sample_call int4 NULL,
	min_inventory int4 NULL,
	num_nws_archv_days int4 NULL,
	num_nws_hdlns_disp int4 NULL,
	pw_last_upd timestamp NULL,
	ams_pwd_freq_cd varchar(10) NULL,
	challenge_answer varchar(250) NULL DEFAULT 'N'::character varying,
	challenge_question varchar(250) NULL DEFAULT 'N'::character varying,
	"comments" varchar(250) NULL,
	cti_acd_userid varchar(15) NULL,
	cti_pwd varchar(30) NULL,
	db_last_upd_src varchar(50) NULL,
	exchng_prof_name varchar(254) NULL,
	exchng_prof_pwd varchar(250) NULL,
	exchng_storeid varchar(250) NULL,
	exchng_sync_type varchar(30) NULL,
	login_domain varchar(50) NULL,
	"password" varchar(30) NULL,
	rpt_srvr_pwd varchar(30) NULL,
	status_cd varchar(30) NULL,
	trng_cal_cd varchar(30) NULL,
	x_cti_stat varchar(20) NULL,
	x_email_flg bpchar(1) NULL,
	x_group_cd varchar(20) NULL,
	x_teleset_no varchar(20) NULL,
	x_vrs_id varchar(20) NULL,
	x_agent_lst_upd timestamp NULL,
	chlng_ans_encrpkey varchar(30) NULL,
	chlng_qst_encrpkey varchar(30) NULL,
	pr_tag_id varchar(15) NULL,
	modification_num varchar(50) NULL,
	CONSTRAINT s_user_pk PRIMARY KEY (row_id)
);
CREATE INDEX s_user_status_cd_idx ON landing.s_user USING btree (status_cd);
CREATE UNIQUE INDEX unique_s_user ON landing.s_user USING btree (row_id);


-- landing.s_zipcode definition

-- Drop table

-- DROP TABLE landing.s_zipcode;

CREATE TABLE landing.s_zipcode (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL DEFAULT CURRENT_DATE,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL DEFAULT CURRENT_DATE,
	last_upd_by varchar(15) NOT NULL,
	dcking_num numeric(22, 7) NULL DEFAULT 0,
	modification_num numeric(10) NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	country varchar(30) NOT NULL DEFAULT 'USA'::character varying,
	zipcode varchar(30) NOT NULL,
	db_last_upd timestamp NULL,
	latitude numeric(22, 7) NULL,
	longitude numeric(22, 7) NULL,
	city varchar(100) NULL,
	continent varchar(30) NULL,
	county varchar(100) NULL,
	db_last_upd_src varchar(50) NULL,
	state_prov varchar(50) NULL,
	street_abbrev varchar(100) NULL,
	street_name varchar(150) NULL,
	x_neighborhood varchar(100) NULL,
	x_user_key varchar(130) NULL,
	x_zipcode varchar(30) NULL,
	x_complement varchar(100) NULL
);


-- landing.zhbrsdt1728 definition

-- Drop table

-- DROP TABLE landing.zhbrsdt1728;

CREATE TABLE landing.zhbrsdt1728 (
	soid varchar(20) NOT NULL,
	dealercode varchar(10) NOT NULL,
	vincode varchar(17) NOT NULL,
	mileage float8 NULL,
	model varchar(40) NULL,
	zyear int4 NULL,
	plate varchar(8) NULL,
	status int2 NULL,
	quicksrv varchar(1) NULL,
	consult_cpf varchar(20) NULL,
	consult_name varchar(30) NULL,
	opendt varchar(14) NULL,
	closedt varchar(14) NULL,
	canceldt varchar(14) NULL,
	deliverydt varchar(14) NULL,
	schedulingdt varchar(14) NULL,
	"comments" varchar(255) NULL,
	filesentdt varchar(14) NULL,
	total_worked_hours float8 NULL,
	total_sold_hours float8 NULL,
	total_value float8 NULL,
	partner varchar NULL,
	firstname varchar(40) NULL,
	lastname varchar(40) NULL,
	cpf varchar(20) NULL,
	city varchar(40) NULL,
	postl_cod1 varchar(10) NULL,
	street varchar(60) NULL,
	house_no varchar(10) NULL,
	country varchar(3) NULL,
	region varchar(3) NULL,
	taxjurcode varchar(15) NULL,
	email varchar(241) NULL,
	tel_number varchar(30) NULL,
	mob_number varchar(30) NULL,
	blockcontact varchar(1) NULL,
	queried varchar(8) NULL,
	ernam varchar(12) NULL,
	erdat date NULL,
	erzet time NULL,
	aenam varchar(12) NULL,
	aedat date NULL,
	aezet time NULL
);


-- landing.zhbrsdt1729 definition

-- Drop table

-- DROP TABLE landing.zhbrsdt1729;

CREATE TABLE landing.zhbrsdt1729 (
	soid varchar(20) NOT NULL,
	dealercode varchar(10) NOT NULL,
	vincode varchar NOT NULL,
	itmnum varchar(5) NOT NULL,
	sotype varchar(255) NULL,
	codsrc varchar(15) NULL,
	zdesc varchar(30) NULL,
	zqty float8 NULL,
	unit varchar(3) NULL,
	value float8 NULL,
	total_value float8 NULL,
	ernam varchar(12) NULL,
	erdat date NULL,
	erzet time NULL,
	aenam varchar(12) NULL,
	aedat date NULL,
	aezet time NULL
);


-- landing.zhbrsdt1730 definition

-- Drop table

-- DROP TABLE landing.zhbrsdt1730;

CREATE TABLE landing.zhbrsdt1730 (
	soid varchar(20) NULL,
	dealercode varchar(10) NULL,
	vincode varchar(17) NULL,
	itmnum varchar(5) NULL,
	sotype varchar(255) NULL,
	pncode varchar(20) NULL,
	zdesc varchar(30) NULL,
	zqty float8 NULL,
	unit varchar(3) NULL,
	value float8 NULL,
	total_value float8 NULL,
	ernam varchar(12) NULL,
	erdat date NULL,
	erzet time NULL,
	aenam varchar(12) NULL,
	aedat date NULL,
	aezet time NULL
);


-- landing.s_addr_per definition

-- Drop table

-- DROP TABLE landing.s_addr_per;

CREATE TABLE landing.s_addr_per (
	row_id varchar(15) NOT NULL,
	created timestamp NOT NULL,
	created_by varchar(15) NOT NULL,
	last_upd timestamp NOT NULL,
	last_upd_by varchar(15) NOT NULL,
	dcking_num int4 NULL DEFAULT 0,
	modification_num int4 NOT NULL DEFAULT 0,
	conflict_id varchar(15) NOT NULL DEFAULT '0'::character varying,
	addr_name varchar(100) NOT NULL DEFAULT 'x'::character varying,
	alignment_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	disa_cleanse_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	location_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	name_lock_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	premise_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	active_flg bpchar(1) NULL,
	altitude int4 NULL,
	db_last_upd timestamp NULL,
	end_dt timestamp NULL,
	info_record_dt timestamp NULL,
	latitude numeric(22, 7) NULL,
	longitude numeric(22, 7) NULL,
	msa int4 NULL,
	start_dt timestamp NULL,
	addr varchar(150) NULL,
	addressee varchar(100) NULL,
	addr_line_2 varchar(100) NULL,
	addr_line_3 varchar(100) NULL,
	addr_line_4 varchar(100) NULL,
	addr_line_5 varchar(100) NULL,
	addr_mail_cd varchar(30) NULL,
	addr_num varchar(30) NULL,
	addr_sub_cd varchar(30) NULL,
	addr_type_cd varchar(30) NULL,
	aia_integ_id varchar(150) NULL,
	billacct_id varchar(15) NULL,
	city varchar(100) NULL,
	"comments" varchar(255) NULL,
	country varchar(30) NULL,
	country_region varchar(100) NULL,
	county varchar(100) NULL,
	cross_st varchar(100) NULL,
	db_last_upd_src varchar(50) NULL,
	"descriptor" varchar(100) NULL,
	district varchar(50) NULL,
	email_addr varchar(350) NULL,
	fax_ph_num varchar(40) NULL,
	integration2_id varchar(30) NULL,
	integration3_id varchar(30) NULL,
	integration_id varchar(30) NULL,
	landlord_name varchar(100) NULL,
	landlord_ph_num varchar(40) NULL,
	metro_area varchar(100) NULL,
	misc_addr_line varchar(100) NULL,
	ownership_cd varchar(30) NULL,
	par_addr_id varchar(15) NULL,
	per_id varchar(15) NULL,
	ph_num varchar(40) NULL,
	province varchar(50) NULL,
	rural_route_num varchar(10) NULL,
	state varchar(50) NULL,
	time_zone_cd varchar(30) NULL,
	utm_easting varchar(30) NULL,
	utm_northing varchar(30) NULL,
	world_area varchar(100) NULL,
	zipcode varchar(30) NULL,
	zipcode_ext varchar(4) NULL,
	x_neighborhood varchar(100) NULL,
	x_replaced_row_id varchar(15) NULL,
	x_snt_addr_flg bpchar(1) NULL,
	aia_integ1_id varchar(500) NULL,
	ed_deleted_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	ed_enabled_flg bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	ext_sys_sync_msg varchar(250) NULL,
	ext_sys_sync_ts timestamp NULL,
	geo_accuracy_code varchar(10) NULL,
	geo_accuracy_msg varchar(255) NULL,
	geo_accuracy_val int4 NULL DEFAULT 0,
	geocd_fail_desc varchar(250) NULL,
	geocd_valid_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	geocode_status_cd varchar(30) NULL,
	geography_code varchar(30) NULL,
	neighborhood_name varchar(50) NULL,
	sync_success_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	verification_code varchar(30) NULL,
	verified_flg bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	verify_status_msg varchar(500) NULL,
	CONSTRAINT s_addr_per_pk PRIMARY KEY (row_id),
	CONSTRAINT s_addr_per_fk FOREIGN KEY (par_addr_id) REFERENCES landing.s_org_ext(row_id)
);
CREATE UNIQUE INDEX unique_s_addr_per ON landing.s_addr_per USING btree (row_id);