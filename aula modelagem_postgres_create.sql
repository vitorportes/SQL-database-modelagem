CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"category" TEXT NOT NULL,
	"size" TEXT NOT NULL,
	"mainPictureId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL,
	"date" DATE NOT NULL,
	"addressId" integer NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orderProducts" (
	"id" serial NOT NULL,
	"orderId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"paidPrice" integer NOT NULL,
	CONSTRAINT "orderProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"orderId" integer NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainPictureId") REFERENCES "pictures"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("addressId") REFERENCES "address"("id");
ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "pictures" ADD CONSTRAINT "pictures_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "orderProducts" ADD CONSTRAINT "orderProducts_fk0" FOREIGN KEY ("orderId") REFERENCES "orders"("id");
ALTER TABLE "orderProducts" ADD CONSTRAINT "orderProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("orderId") REFERENCES "orders"("id");
ALTER TABLE "address" ADD CONSTRAINT "address_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");







