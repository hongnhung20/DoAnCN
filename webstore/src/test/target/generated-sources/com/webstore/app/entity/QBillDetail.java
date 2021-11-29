package com.webstore.app.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QBillDetail is a Querydsl query type for BillDetail
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QBillDetail extends EntityPathBase<BillDetail> {

    private static final long serialVersionUID = -1256696670L;

    public static final QBillDetail billDetail = new QBillDetail("billDetail");

    public final NumberPath<Long> billDetailID = createNumber("billDetailID", Long.class);

    public final NumberPath<Long> billId = createNumber("billId", Long.class);

    public final NumberPath<Double> price = createNumber("price", Double.class);

    public final NumberPath<Long> productId = createNumber("productId", Long.class);

    public final NumberPath<Integer> quantity = createNumber("quantity", Integer.class);

    public QBillDetail(String variable) {
        super(BillDetail.class, forVariable(variable));
    }

    public QBillDetail(Path<? extends BillDetail> path) {
        super(path.getType(), path.getMetadata());
    }

    public QBillDetail(PathMetadata metadata) {
        super(BillDetail.class, metadata);
    }

}

