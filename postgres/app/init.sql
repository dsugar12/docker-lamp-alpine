--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin (
    uuid character varying(100) NOT NULL,
    amount integer
);


ALTER TABLE public.coin OWNER TO postgres;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    sale_id integer NOT NULL,
    uuid character varying(100),
    product character varying(200),
    sale_date timestamp with time zone
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_sale_id_seq OWNER TO postgres;

--
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;


--
-- Name: wrestlers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wrestlers (
    uuid character varying(100) NOT NULL,
    wins integer
);


ALTER TABLE public.wrestlers OWNER TO postgres;

--
-- Name: sales sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);


--
-- Data for Name: coin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coin (uuid, amount) FROM stdin;
042534d1-fd2d-44e4-8488-065949816e22	900
04f8c447-218c-4d07-970e-af7ccb1d1e6c	7750
05497d0e-9969-4326-bcbf-425481a85c82	1000
0a81e8e3-165b-4318-bd20-359d06ef7fa7	1000
0b977d4a-2d16-4ad2-b548-4784d7565262	2000
0c795f04-f6d7-4521-bb2d-3a341617c019	8450
120af9a9-120f-4ad4-909a-793952bb1a3c	1000
1360cd10-87cb-4c25-bef9-36dd770b3eed	500
18c1fc7c-da00-4775-90f3-e4cf27694360	2500
19dc33ea-4088-40ca-9158-fed5fb204781	1000
20b750f4-e11b-4a82-a04c-97f17d300440	2000
210b2555-2f0c-4841-9321-4704dd6f0d53	11710
22a8d642-2c80-4df1-bbdf-e86516b62c95	500
27fe9af0-8c0f-47a3-b272-8cce6f266030	1000
298d1b78-c66c-4d89-ac85-00f7f92b0f01	6000
2a721d3f-5a83-4ef3-8f5b-b18a46783745	35040
2bdf467f-1817-4e60-b02f-c9e1a8c26a78	1000
2f2b43bf-4317-4a3a-8c68-733a1aaea791	7360
320734fd-f7f3-46a1-a481-f8ff8270fd76	1000
32156b4f-a88b-4c14-9147-0b77bd5c40cb	1000
3444ce7b-5635-41f3-b4a6-8fb9b5471ec9	1660
36df0fe2-77f9-4972-ae8f-6d4a551b056e	0
36fed49b-d296-4e73-92c2-132e37224315	5000
387b99f6-8a18-466e-9f43-61564df21be3	3500
394bfa47-3698-4f73-8393-558c1cb655f8	1000
3e83c558-ed13-476f-a9ff-036aef6d7fbc	500
3e87b896-b072-4eb1-b7a1-439945606b2b	1000
422e84b4-d0f2-4024-b15a-a9c702badc6f	1000
475d212a-a97c-4939-a97c-c04664b686f4	500
4b535da1-d230-4f7b-b31b-622d3f2f1891	1000
4d10de4f-02b0-452a-b457-343ce34cb24a	1000
4f2f868c-9314-45f5-9970-7d804605e364	0
52cb0a53-9b75-4e2b-98a6-72395486a32c	0
53ed1657-b27d-4e6a-91bf-ec1ff00291c9	1000
55bf1439-6c3e-4f21-a8df-0f505c7d4d3a	1000
5779948f-f309-4dda-9b70-c3bf1d7e87ff	1660
5b781d14-1475-48ac-8020-3030e4c66f69	1750
5bf3e99f-ada6-4a87-abcb-f289369f6010	2500
5f3fef67-ca81-494d-b87a-49d2b5d90d72	500
60d572be-7b2b-465e-b92f-7a95a9eafe65	2000
62cb8757-5c19-411a-abc5-90b725148ef7	0
642b541f-89a6-4aed-8664-51a2c3fa7a60	0
65bb1ac6-51b1-4ed2-aff3-c9e09ae42741	1000
66e5f710-3e0f-4c49-a178-7f9ee5b19b9c	7660
6bebb518-e55a-4a39-83cf-dd9e62168f22	83300
6c6e8997-0a45-4704-bbe4-112a01427eb8	1000
6ef98177-26c5-470d-bf1e-d1d4d41e5ead	0
6fe4ee96-0248-4d0c-a643-9f31d9c7ebfb	2500
7670a189-47cb-434e-a403-27b9cdd8e5b8	500
7725611a-c033-448a-ba6d-68e8495a5656	1495
77cf1d7e-9c67-4f7a-98ee-b2b04716a53a	1000
782b8f90-4ce5-4110-90c3-0feed12a5b1e	1000
782ed4f4-6aba-4fdd-855b-e2744cba30c8	1000
7981f8ea-4918-4cc8-97ff-89b21b458895	1660
7b5906dd-8f4b-4bb2-aff2-94bbbd24f783	1500
7e601f9f-1d5f-47f3-b776-bf71b4a84a8a	0
7ecaed85-d154-4484-87f0-65ed51ebffaf	1000
80e19770-ee39-420a-92dd-e2d69ec7904e	1000
83295209-4753-4fa5-8543-2dea2b68f967	0
85997cd2-6f06-4f92-b310-fe182a3486b4	500
8a10e5f6-9b8b-4aec-bd36-47149a7c50bd	1000
8c7bb041-4382-48b4-bb20-6194108374cf	3320
8e436947-064e-4311-8bf6-97c30cf2d770	2000
935ec23b-fa6f-470f-95dd-74e6968fb5de	0
95179e98-ca53-4c82-ab64-6fc9241a63a7	3250
97e20970-4f89-4af9-804a-f76c96f86bea	1150
993e7368-571d-4357-ab14-697baa126fb2	4980
a1025ee1-1239-46a2-81a8-56ccde49d8d5	500
a29e4fcd-49bd-40ae-99b4-daa4030395fb	0
a5cb392a-2b9b-4d8e-b398-67fc8124ff5d	1000
a69e9047-7bff-4e6e-abb5-0412c5b3ad6c	1000
a91fbb58-6d1d-4acf-b1dd-bca9ff5af1d4	47800
abc96c21-465f-4c49-a29c-d4881bc5d899	2500
ad750f27-cad7-463c-9365-0c5171b098fd	1000
b14f2250-7a33-455b-8e86-e67c257d40d1	0
b1c87c4c-9211-4669-8461-24d4b97759c3	1000
b30ad587-172a-435c-9941-c3d33dbe9421	12502
b319bc72-b1b9-4919-8084-966dee92fe59	1000
b5a7d1bc-c5bf-4551-9124-10cd58854dc5	1660
ba8b27b5-e566-43ec-b433-b72c747790db	1000
bc69fe98-1423-418e-9630-3173ba29f1c5	1000
c095a063-5afe-4961-8f9e-bd74656ebfd9	2000
c17eb911-379c-4c77-a869-12e769cf7a17	1750
c2f77092-6ccb-4e6c-b34a-e81edf8945f0	0
c374afd2-0d06-414d-a3c3-d3b35d6cfe99	1000
c83b71e6-da9c-4a8b-b1f8-36c775e73be7	500
cec578e3-d9c4-4aa0-b999-45f077ed697a	0
d00c6f2a-184c-4e49-bd5b-98f2c5fb2d2b	1000
d2d10f64-5cff-4a7c-9341-b946fea0e66a	1000
d2d7e121-779a-4dd4-9ac2-6e66e7d014ce	1540
d38d6cd4-322b-460e-972a-d3aa9a2b4381	1000
d3df65d5-c852-42d9-b3b0-b0db37b22d73	500
d92fd27e-7ca9-4056-be0b-a042284d3371	8750
db5c6747-5a77-4ccb-bf6b-b05cd0b859ff	0
db7407c1-b047-4ae6-8261-6fa206c51df2	1000
dbb599d4-d6d6-4323-932c-e0fa088f4bc6	34670
dc4892f5-c2be-4d6d-8314-4da9a79ebc33	6000
dd6b2fb9-c9a6-4cd5-95d0-69997130890a	1000
ddc4ca98-359e-43c4-b487-a804c121c44f	79860
e3397586-e87b-4bc1-8175-2de6dd4b6430	3500
e3ec619e-264a-4f1a-af55-a87aba23fc98	1000
e754b3f1-cf7c-4987-a8e3-cc76e06631e1	650
e7fa8a27-2221-4554-b55e-9e8a5ff53873	162700
e89c11d2-1902-4aa5-ad84-e11697745840	500
ebd4ca7b-30b9-4efe-99a1-e77e299e96eb	1500
ec11a9d5-e060-4b27-a6a9-800e540e2e40	2500
f05b0bba-f20e-4e0c-90f3-7fda564f818e	0
f2bb6687-be48-4650-adf1-473c160675ce	1000
f33cde57-c8c6-498b-8bb6-d61f77f09191	0
f4f597e2-6335-4eaf-979b-d37e1e7de801	500
f5322c49-c5cd-4e88-aa65-4abeff8c012d	0
f641b600-4f31-4baa-8fde-d764c1b5c98d	1500
f6f75cc4-3624-4a48-a026-d5352cc43b17	9140
f7baa5ce-6ed0-4fac-8a32-3bf64bc223e2	2500
f9c9e9be-e5ec-4d5f-9543-1fc1683ad936	3250
fa8c67dd-78ca-4f86-ae66-cee195137a63	1000
faeb7500-5dfd-496e-8a59-c79798b69343	2000
fe454fdf-a4f2-4123-ab19-d49636f4c0d0	500
ec4f39ef-2d63-4adc-ad2d-ac43f81de875	230610
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (sale_id, uuid, product, sale_date) FROM stdin;
1	ec4f39ef-2d63-4adc-ad2d-ac43f81de875	My Wonderful Product	2023-04-30 13:10:09.885624+00
\.


--
-- Data for Name: wrestlers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wrestlers (uuid, wins) FROM stdin;
04f8c447-218c-4d07-970e-af7ccb1d1e6c	3
09a947fa-be2c-4499-87b1-0c9ead8f727f	-2
0a81e8e3-165b-4318-bd20-359d06ef7fa7	0
0a9cfd03-27b5-4894-ab7c-10a43d629043	-1
120af9a9-120f-4ad4-909a-793952bb1a3c	1
19883bd9-873a-43c6-9db5-e5c8193bbb2b	-2
20b750f4-e11b-4a82-a04c-97f17d300440	-1
210b2555-2f0c-4841-9321-4704dd6f0d53	0
2a721d3f-5a83-4ef3-8f5b-b18a46783745	1
2d401067-bf83-4f6a-a9cb-74f29e91e720	1
2f2b43bf-4317-4a3a-8c68-733a1aaea791	-3
302f2496-6f3d-4930-be83-3e4dfdff8e3a	0
3444ce7b-5635-41f3-b4a6-8fb9b5471ec9	-1
36fed49b-d296-4e73-92c2-132e37224315	1
394bfa47-3698-4f73-8393-558c1cb655f8	1
3e83c558-ed13-476f-a9ff-036aef6d7fbc	-7
57502987-23b8-4b52-866d-40cd2620ee17	-1
5f3fef67-ca81-494d-b87a-49d2b5d90d72	1
62cb8757-5c19-411a-abc5-90b725148ef7	-6
6577b335-4c2f-48a9-85ce-45eb90fdba15	0
65bb1ac6-51b1-4ed2-aff3-c9e09ae42741	1
6bebb518-e55a-4a39-83cf-dd9e62168f22	2
6ef3b041-cfe2-4665-867f-dcabbbff8892	1
71a03fcb-ec0b-479d-933b-2434b81036be	1
7981f8ea-4918-4cc8-97ff-89b21b458895	3
7c47d585-d874-4bba-a8ab-afe9f2843cc5	1
8b7897d0-7328-4cfa-ab47-61e948bc8b58	-1
8c7bb041-4382-48b4-bb20-6194108374cf	-1
8e436947-064e-4311-8bf6-97c30cf2d770	-2
93511adc-2259-403f-992c-98044727f7d4	-1
935ec23b-fa6f-470f-95dd-74e6968fb5de	-3
9509935a-67ab-4089-91b3-44ed6d61b36a	0
95179e98-ca53-4c82-ab64-6fc9241a63a7	2
95192c6d-8c32-4416-ae5f-6bd675100264	1
993e7368-571d-4357-ab14-697baa126fb2	3
9aa01d94-f062-4442-9c65-0d3184f4d0c1	1
9af1b87d-1a63-4b0e-9827-dc08ab43a2ab	2
a1025ee1-1239-46a2-81a8-56ccde49d8d5	2
a5cb392a-2b9b-4d8e-b398-67fc8124ff5d	1
a9ecca36-08ee-49d2-86ea-d08ff44a6710	-1
b5a7d1bc-c5bf-4551-9124-10cd58854dc5	1
bc69fe98-1423-418e-9630-3173ba29f1c5	-6
bdc54436-0597-40cd-9311-67db5af25b2f	1
c1f33189-1b15-461e-92c2-f2d34320c233	-1
cc414b6e-1122-4243-ab51-1151b0c099ab	2
d2d7e121-779a-4dd4-9ac2-6e66e7d014ce	-3
d5c88518-c5b1-4031-9332-248df18ccfc6	-1
d697cfb9-acf4-4eb0-8525-4a18bf2bf053	1
dbb599d4-d6d6-4323-932c-e0fa088f4bc6	2
dc4892f5-c2be-4d6d-8314-4da9a79ebc33	4
dd6b2fb9-c9a6-4cd5-95d0-69997130890a	3
ddc4ca98-359e-43c4-b487-a804c121c44f	-5
ddce1766-5950-40ed-acad-845d13946d16	0
e754b3f1-cf7c-4987-a8e3-cc76e06631e1	-1
e7fa8a27-2221-4554-b55e-9e8a5ff53873	-4
e89c11d2-1902-4aa5-ad84-e11697745840	0
ea3e6027-3e81-4fbd-9e32-96d8fe8241ef	-1
f4f597e2-6335-4eaf-979b-d37e1e7de801	-1
f5322c49-c5cd-4e88-aa65-4abeff8c012d	4
f6f75cc4-3624-4a48-a026-d5352cc43b17	-1
f9c9e9be-e5ec-4d5f-9543-1fc1683ad936	4
fb495c08-bf47-4e86-b781-4202ceb96576	1
ff4dd155-2291-4074-9064-de098bb83508	1
ec4f39ef-2d63-4adc-ad2d-ac43f81de875	4
\.


--
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_sale_id_seq', 1, true);


--
-- Name: coin coin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_pkey PRIMARY KEY (uuid);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- Name: wrestlers wrestlers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wrestlers
    ADD CONSTRAINT wrestlers_pkey PRIMARY KEY (uuid);


--
-- PostgreSQL database dump complete
--

