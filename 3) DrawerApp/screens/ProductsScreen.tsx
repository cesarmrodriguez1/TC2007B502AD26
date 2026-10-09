import React from 'react';

import {
  View,
  Text,
  StyleSheet,
  FlatList,
} from 'react-native';

interface Product {
  id: string;
  name: string;
  price: string;
  description: string;
}

const products: Product[] = [

  {
    id: '1',
    name: 'Laptop',
    price: '$18,500',
    description:
      'Computadora portátil para trabajo y estudio.',
  },

  {
    id: '2',
    name: 'Smartphone',
    price: '$12,999',
    description:
      'Teléfono inteligente de última generación.',
  },

  {
    id: '3',
    name: 'Tablet',
    price: '$8,500',
    description:
      'Tablet ideal para estudiar y consumir contenido.',
  },

  {
    id: '4',
    name: 'Audífonos',
    price: '$2,499',
    description:
      'Audífonos inalámbricos con cancelación de ruido.',
  },

];

const ProductsScreen = () => {

  const renderProduct = ({
    item,
  }: {
    item: Product;
  }) => {

    return (

      <View style={styles.card}>

        <View style={styles.productIcon}>
          <Text style={styles.productEmoji}>
            📦
          </Text>
        </View>

        <View style={styles.productInfo}>

          <Text style={styles.productName}>
            {item.name}
          </Text>

          <Text style={styles.description}>
            {item.description}
          </Text>

          <Text style={styles.price}>
            {item.price}
          </Text>

        </View>

      </View>

    );
  };

  return (

    <View style={styles.container}>

      <Text style={styles.title}>
        Productos
      </Text>

      <Text style={styles.subtitle}>
        Catálogo de productos disponibles
      </Text>

      <FlatList
        data={products}
        renderItem={renderProduct}
        keyExtractor={(item) => item.id}
        contentContainerStyle={styles.list}
        showsVerticalScrollIndicator={false}
      />

    </View>

  );
};

const styles = StyleSheet.create({

  container: {
    flex: 1,
    backgroundColor: '#E3F2FD',
    paddingTop: 55,
    paddingHorizontal: 20,
  },

  title: {
    fontSize: 30,
    fontWeight: 'bold',
    color: '#0D47A1',
    textAlign: 'center',
  },

  subtitle: {
    fontSize: 16,
    color: '#546E7A',
    textAlign: 'center',
    marginTop: 8,
    marginBottom: 20,
  },

  list: {
    paddingBottom: 30,
  },

  card: {
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    padding: 18,
    marginBottom: 15,
    flexDirection: 'row',
    alignItems: 'center',
    elevation: 5,
  },

  productIcon: {
    width: 65,
    height: 65,
    borderRadius: 15,
    backgroundColor: '#E3F2FD',
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 15,
  },

  productEmoji: {
    fontSize: 30,
  },

  productInfo: {
    flex: 1,
  },

  productName: {
    fontSize: 19,
    fontWeight: 'bold',
    color: '#1565C0',
    marginBottom: 5,
  },

  description: {
    fontSize: 13,
    color: '#666666',
    marginBottom: 8,
  },

  price: {
    fontSize: 17,
    fontWeight: 'bold',
    color: '#0D47A1',
  },

});

export default ProductsScreen;