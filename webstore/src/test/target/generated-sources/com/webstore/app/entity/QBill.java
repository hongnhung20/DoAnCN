package com.webstore.app.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QBill is a Querydsl query type for Bill
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QBill extends EntityPathBase<Bill> {

    private static final long serialVersionUID = -3045135L;

    public static final QBill bill = new QBill("bill");

    public final StringPath address = createString("address");

    public final DateTimePath<java.util.Date> date = createDateTime("date", java.util.Date.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final BooleanPath noti = createBoolean("noti");

    public final StringPath payment = createString("payment");

    public final StringPath phone = createString("phone");

    public final NumberPath<Short> status = createNumber("status", Short.class);

    public final NumberPath<Double> total = createNumber("total", Double.class);

    public final NumberPath<Long> userId = createNumber("userId", Long.class);

    public QBill(String variable) {
        super(Bill.class, forVariable(variable));
    }

    public QBill(Path<? extends Bill> path) {
        super(path.getType(), path.getMetadata());
    }

    public QBill(PathMetadata metadata) {
        super(Bill.class, metadata);
    }

}

