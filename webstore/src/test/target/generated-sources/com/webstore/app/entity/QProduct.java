package com.webstore.app.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QProduct is a Querydsl query type for Product
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QProduct extends EntityPathBase<Product> {

    private static final long serialVersionUID = -722843707L;

    public static final QProduct product = new QProduct("product");

    public final NumberPath<Long> categoryId = createNumber("categoryId", Long.class);

    public final NumberPath<Double> productBuy = createNumber("productBuy", Double.class);

    public final StringPath productDescription = createString("productDescription");

    public final NumberPath<Long> productID = createNumber("productID", Long.class);

    public final StringPath productImage = createString("productImage");

    public final StringPath productName = createString("productName");

    public final NumberPath<Double> productPrice = createNumber("productPrice", Double.class);

    public final StringPath productProvider = createString("productProvider");

    public final NumberPath<Integer> productQuantity = createNumber("productQuantity", Integer.class);

    public QProduct(String variable) {
        super(Product.class, forVariable(variable));
    }

    public QProduct(Path<? extends Product> path) {
        super(path.getType(), path.getMetadata());
    }

    public QProduct(PathMetadata metadata) {
        super(Product.class, metadata);
    }

}

