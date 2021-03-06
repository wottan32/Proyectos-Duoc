﻿//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.ComponentModel;
using System.Data.EntityClient;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Runtime.Serialization;
using System.Xml.Serialization;

[assembly: EdmSchemaAttribute()]
#region Metadatos de relaciones en EDM

[assembly: EdmRelationshipAttribute("FactoryPCModel", "FK_ProductosXCarrito_codCarrito", "Carrito", System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(FactoryPC.DALC.Carrito), "ProductosXCarrito", System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(FactoryPC.DALC.ProductosXCarrito), true)]
[assembly: EdmRelationshipAttribute("FactoryPCModel", "FK_Venta_codCarrito", "Carrito", System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(FactoryPC.DALC.Carrito), "Venta", System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(FactoryPC.DALC.Venta), true)]
[assembly: EdmRelationshipAttribute("FactoryPCModel", "FK_ProductosXCarrito_codProducto", "Producto", System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(FactoryPC.DALC.Producto), "ProductosXCarrito", System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(FactoryPC.DALC.ProductosXCarrito), true)]
[assembly: EdmRelationshipAttribute("FactoryPCModel", "FK_Venta_rutUsuario", "Usuario", System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(FactoryPC.DALC.Usuario), "Venta", System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(FactoryPC.DALC.Venta), true)]

#endregion

namespace FactoryPC.DALC
{
    #region Contextos
    
    /// <summary>
    /// No hay documentación de metadatos disponible.
    /// </summary>
    public partial class FactoryPCEntities : ObjectContext
    {
        #region Constructores
    
        /// <summary>
        /// Inicializa un nuevo objeto FactoryPCEntities usando la cadena de conexión encontrada en la sección 'FactoryPCEntities' del archivo de configuración de la aplicación.
        /// </summary>
        public FactoryPCEntities() : base("name=FactoryPCEntities", "FactoryPCEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Inicializar un nuevo objeto FactoryPCEntities.
        /// </summary>
        public FactoryPCEntities(string connectionString) : base(connectionString, "FactoryPCEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Inicializar un nuevo objeto FactoryPCEntities.
        /// </summary>
        public FactoryPCEntities(EntityConnection connection) : base(connection, "FactoryPCEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        #endregion
    
        #region Métodos parciales
    
        partial void OnContextCreated();
    
        #endregion
    
        #region Propiedades de ObjectSet
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        public ObjectSet<Carrito> Carrito
        {
            get
            {
                if ((_Carrito == null))
                {
                    _Carrito = base.CreateObjectSet<Carrito>("Carrito");
                }
                return _Carrito;
            }
        }
        private ObjectSet<Carrito> _Carrito;
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        public ObjectSet<Producto> Producto
        {
            get
            {
                if ((_Producto == null))
                {
                    _Producto = base.CreateObjectSet<Producto>("Producto");
                }
                return _Producto;
            }
        }
        private ObjectSet<Producto> _Producto;
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        public ObjectSet<ProductosXCarrito> ProductosXCarrito
        {
            get
            {
                if ((_ProductosXCarrito == null))
                {
                    _ProductosXCarrito = base.CreateObjectSet<ProductosXCarrito>("ProductosXCarrito");
                }
                return _ProductosXCarrito;
            }
        }
        private ObjectSet<ProductosXCarrito> _ProductosXCarrito;
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        public ObjectSet<Usuario> Usuario
        {
            get
            {
                if ((_Usuario == null))
                {
                    _Usuario = base.CreateObjectSet<Usuario>("Usuario");
                }
                return _Usuario;
            }
        }
        private ObjectSet<Usuario> _Usuario;
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        public ObjectSet<Venta> Venta
        {
            get
            {
                if ((_Venta == null))
                {
                    _Venta = base.CreateObjectSet<Venta>("Venta");
                }
                return _Venta;
            }
        }
        private ObjectSet<Venta> _Venta;

        #endregion

        #region Métodos AddTo
    
        /// <summary>
        /// Método desusado para agregar un nuevo objeto al EntitySet Carrito. Considere la posibilidad de usar el método .Add de la propiedad ObjectSet&lt;T&gt; asociada.
        /// </summary>
        public void AddToCarrito(Carrito carrito)
        {
            base.AddObject("Carrito", carrito);
        }
    
        /// <summary>
        /// Método desusado para agregar un nuevo objeto al EntitySet Producto. Considere la posibilidad de usar el método .Add de la propiedad ObjectSet&lt;T&gt; asociada.
        /// </summary>
        public void AddToProducto(Producto producto)
        {
            base.AddObject("Producto", producto);
        }
    
        /// <summary>
        /// Método desusado para agregar un nuevo objeto al EntitySet ProductosXCarrito. Considere la posibilidad de usar el método .Add de la propiedad ObjectSet&lt;T&gt; asociada.
        /// </summary>
        public void AddToProductosXCarrito(ProductosXCarrito productosXCarrito)
        {
            base.AddObject("ProductosXCarrito", productosXCarrito);
        }
    
        /// <summary>
        /// Método desusado para agregar un nuevo objeto al EntitySet Usuario. Considere la posibilidad de usar el método .Add de la propiedad ObjectSet&lt;T&gt; asociada.
        /// </summary>
        public void AddToUsuario(Usuario usuario)
        {
            base.AddObject("Usuario", usuario);
        }
    
        /// <summary>
        /// Método desusado para agregar un nuevo objeto al EntitySet Venta. Considere la posibilidad de usar el método .Add de la propiedad ObjectSet&lt;T&gt; asociada.
        /// </summary>
        public void AddToVenta(Venta venta)
        {
            base.AddObject("Venta", venta);
        }

        #endregion

    }

    #endregion

    #region Entidades
    
    /// <summary>
    /// No hay documentación de metadatos disponible.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="FactoryPCModel", Name="Carrito")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class Carrito : EntityObject
    {
        #region Método de generador
    
        /// <summary>
        /// Crear un nuevo objeto Carrito.
        /// </summary>
        /// <param name="codCarrito">Valor inicial de la propiedad codCarrito.</param>
        public static Carrito CreateCarrito(global::System.Int32 codCarrito)
        {
            Carrito carrito = new Carrito();
            carrito.codCarrito = codCarrito;
            return carrito;
        }

        #endregion

        #region Propiedades primitivas
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 codCarrito
        {
            get
            {
                return _codCarrito;
            }
            set
            {
                if (_codCarrito != value)
                {
                    OncodCarritoChanging(value);
                    ReportPropertyChanging("codCarrito");
                    _codCarrito = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("codCarrito");
                    OncodCarritoChanged();
                }
            }
        }
        private global::System.Int32 _codCarrito;
        partial void OncodCarritoChanging(global::System.Int32 value);
        partial void OncodCarritoChanged();

        #endregion

    
        #region Propiedades de navegación
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("FactoryPCModel", "FK_ProductosXCarrito_codCarrito", "ProductosXCarrito")]
        public EntityCollection<ProductosXCarrito> ProductosXCarrito
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedCollection<ProductosXCarrito>("FactoryPCModel.FK_ProductosXCarrito_codCarrito", "ProductosXCarrito");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedCollection<ProductosXCarrito>("FactoryPCModel.FK_ProductosXCarrito_codCarrito", "ProductosXCarrito", value);
                }
            }
        }
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("FactoryPCModel", "FK_Venta_codCarrito", "Venta")]
        public EntityCollection<Venta> Venta
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedCollection<Venta>("FactoryPCModel.FK_Venta_codCarrito", "Venta");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedCollection<Venta>("FactoryPCModel.FK_Venta_codCarrito", "Venta", value);
                }
            }
        }

        #endregion

    }
    
    /// <summary>
    /// No hay documentación de metadatos disponible.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="FactoryPCModel", Name="Producto")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class Producto : EntityObject
    {
        #region Método de generador
    
        /// <summary>
        /// Crear un nuevo objeto Producto.
        /// </summary>
        /// <param name="codProducto">Valor inicial de la propiedad codProducto.</param>
        /// <param name="nombre">Valor inicial de la propiedad nombre.</param>
        /// <param name="precio">Valor inicial de la propiedad precio.</param>
        public static Producto CreateProducto(global::System.Int32 codProducto, global::System.String nombre, global::System.Int64 precio)
        {
            Producto producto = new Producto();
            producto.codProducto = codProducto;
            producto.nombre = nombre;
            producto.precio = precio;
            return producto;
        }

        #endregion

        #region Propiedades primitivas
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 codProducto
        {
            get
            {
                return _codProducto;
            }
            set
            {
                if (_codProducto != value)
                {
                    OncodProductoChanging(value);
                    ReportPropertyChanging("codProducto");
                    _codProducto = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("codProducto");
                    OncodProductoChanged();
                }
            }
        }
        private global::System.Int32 _codProducto;
        partial void OncodProductoChanging(global::System.Int32 value);
        partial void OncodProductoChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String nombre
        {
            get
            {
                return _nombre;
            }
            set
            {
                OnnombreChanging(value);
                ReportPropertyChanging("nombre");
                _nombre = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("nombre");
                OnnombreChanged();
            }
        }
        private global::System.String _nombre;
        partial void OnnombreChanging(global::System.String value);
        partial void OnnombreChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int64 precio
        {
            get
            {
                return _precio;
            }
            set
            {
                OnprecioChanging(value);
                ReportPropertyChanging("precio");
                _precio = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("precio");
                OnprecioChanged();
            }
        }
        private global::System.Int64 _precio;
        partial void OnprecioChanging(global::System.Int64 value);
        partial void OnprecioChanged();

        #endregion

    
        #region Propiedades de navegación
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("FactoryPCModel", "FK_ProductosXCarrito_codProducto", "ProductosXCarrito")]
        public EntityCollection<ProductosXCarrito> ProductosXCarrito
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedCollection<ProductosXCarrito>("FactoryPCModel.FK_ProductosXCarrito_codProducto", "ProductosXCarrito");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedCollection<ProductosXCarrito>("FactoryPCModel.FK_ProductosXCarrito_codProducto", "ProductosXCarrito", value);
                }
            }
        }

        #endregion

    }
    
    /// <summary>
    /// No hay documentación de metadatos disponible.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="FactoryPCModel", Name="ProductosXCarrito")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class ProductosXCarrito : EntityObject
    {
        #region Método de generador
    
        /// <summary>
        /// Crear un nuevo objeto ProductosXCarrito.
        /// </summary>
        /// <param name="codProducto">Valor inicial de la propiedad codProducto.</param>
        /// <param name="codCarrito">Valor inicial de la propiedad codCarrito.</param>
        /// <param name="codLista">Valor inicial de la propiedad codLista.</param>
        /// <param name="cantidad">Valor inicial de la propiedad cantidad.</param>
        public static ProductosXCarrito CreateProductosXCarrito(global::System.Int32 codProducto, global::System.Int32 codCarrito, global::System.Int32 codLista, global::System.Int32 cantidad)
        {
            ProductosXCarrito productosXCarrito = new ProductosXCarrito();
            productosXCarrito.codProducto = codProducto;
            productosXCarrito.codCarrito = codCarrito;
            productosXCarrito.codLista = codLista;
            productosXCarrito.cantidad = cantidad;
            return productosXCarrito;
        }

        #endregion

        #region Propiedades primitivas
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 codProducto
        {
            get
            {
                return _codProducto;
            }
            set
            {
                OncodProductoChanging(value);
                ReportPropertyChanging("codProducto");
                _codProducto = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("codProducto");
                OncodProductoChanged();
            }
        }
        private global::System.Int32 _codProducto;
        partial void OncodProductoChanging(global::System.Int32 value);
        partial void OncodProductoChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 codCarrito
        {
            get
            {
                return _codCarrito;
            }
            set
            {
                OncodCarritoChanging(value);
                ReportPropertyChanging("codCarrito");
                _codCarrito = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("codCarrito");
                OncodCarritoChanged();
            }
        }
        private global::System.Int32 _codCarrito;
        partial void OncodCarritoChanging(global::System.Int32 value);
        partial void OncodCarritoChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 codLista
        {
            get
            {
                return _codLista;
            }
            set
            {
                if (_codLista != value)
                {
                    OncodListaChanging(value);
                    ReportPropertyChanging("codLista");
                    _codLista = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("codLista");
                    OncodListaChanged();
                }
            }
        }
        private global::System.Int32 _codLista;
        partial void OncodListaChanging(global::System.Int32 value);
        partial void OncodListaChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 cantidad
        {
            get
            {
                return _cantidad;
            }
            set
            {
                OncantidadChanging(value);
                ReportPropertyChanging("cantidad");
                _cantidad = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("cantidad");
                OncantidadChanged();
            }
        }
        private global::System.Int32 _cantidad;
        partial void OncantidadChanging(global::System.Int32 value);
        partial void OncantidadChanged();

        #endregion

    
        #region Propiedades de navegación
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("FactoryPCModel", "FK_ProductosXCarrito_codCarrito", "Carrito")]
        public Carrito Carrito
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Carrito>("FactoryPCModel.FK_ProductosXCarrito_codCarrito", "Carrito").Value;
            }
            set
            {
                ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Carrito>("FactoryPCModel.FK_ProductosXCarrito_codCarrito", "Carrito").Value = value;
            }
        }
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [BrowsableAttribute(false)]
        [DataMemberAttribute()]
        public EntityReference<Carrito> CarritoReference
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Carrito>("FactoryPCModel.FK_ProductosXCarrito_codCarrito", "Carrito");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedReference<Carrito>("FactoryPCModel.FK_ProductosXCarrito_codCarrito", "Carrito", value);
                }
            }
        }
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("FactoryPCModel", "FK_ProductosXCarrito_codProducto", "Producto")]
        public Producto Producto
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Producto>("FactoryPCModel.FK_ProductosXCarrito_codProducto", "Producto").Value;
            }
            set
            {
                ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Producto>("FactoryPCModel.FK_ProductosXCarrito_codProducto", "Producto").Value = value;
            }
        }
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [BrowsableAttribute(false)]
        [DataMemberAttribute()]
        public EntityReference<Producto> ProductoReference
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Producto>("FactoryPCModel.FK_ProductosXCarrito_codProducto", "Producto");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedReference<Producto>("FactoryPCModel.FK_ProductosXCarrito_codProducto", "Producto", value);
                }
            }
        }

        #endregion

    }
    
    /// <summary>
    /// No hay documentación de metadatos disponible.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="FactoryPCModel", Name="Usuario")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class Usuario : EntityObject
    {
        #region Método de generador
    
        /// <summary>
        /// Crear un nuevo objeto Usuario.
        /// </summary>
        /// <param name="rut">Valor inicial de la propiedad rut.</param>
        /// <param name="nombres">Valor inicial de la propiedad nombres.</param>
        /// <param name="apellidos">Valor inicial de la propiedad apellidos.</param>
        /// <param name="email">Valor inicial de la propiedad email.</param>
        /// <param name="telefono">Valor inicial de la propiedad telefono.</param>
        public static Usuario CreateUsuario(global::System.String rut, global::System.String nombres, global::System.String apellidos, global::System.String email, global::System.String telefono)
        {
            Usuario usuario = new Usuario();
            usuario.rut = rut;
            usuario.nombres = nombres;
            usuario.apellidos = apellidos;
            usuario.email = email;
            usuario.telefono = telefono;
            return usuario;
        }

        #endregion

        #region Propiedades primitivas
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String rut
        {
            get
            {
                return _rut;
            }
            set
            {
                if (_rut != value)
                {
                    OnrutChanging(value);
                    ReportPropertyChanging("rut");
                    _rut = StructuralObject.SetValidValue(value, false);
                    ReportPropertyChanged("rut");
                    OnrutChanged();
                }
            }
        }
        private global::System.String _rut;
        partial void OnrutChanging(global::System.String value);
        partial void OnrutChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String nombres
        {
            get
            {
                return _nombres;
            }
            set
            {
                OnnombresChanging(value);
                ReportPropertyChanging("nombres");
                _nombres = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("nombres");
                OnnombresChanged();
            }
        }
        private global::System.String _nombres;
        partial void OnnombresChanging(global::System.String value);
        partial void OnnombresChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String apellidos
        {
            get
            {
                return _apellidos;
            }
            set
            {
                OnapellidosChanging(value);
                ReportPropertyChanging("apellidos");
                _apellidos = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("apellidos");
                OnapellidosChanged();
            }
        }
        private global::System.String _apellidos;
        partial void OnapellidosChanging(global::System.String value);
        partial void OnapellidosChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String email
        {
            get
            {
                return _email;
            }
            set
            {
                OnemailChanging(value);
                ReportPropertyChanging("email");
                _email = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("email");
                OnemailChanged();
            }
        }
        private global::System.String _email;
        partial void OnemailChanging(global::System.String value);
        partial void OnemailChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String telefono
        {
            get
            {
                return _telefono;
            }
            set
            {
                OntelefonoChanging(value);
                ReportPropertyChanging("telefono");
                _telefono = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("telefono");
                OntelefonoChanged();
            }
        }
        private global::System.String _telefono;
        partial void OntelefonoChanging(global::System.String value);
        partial void OntelefonoChanged();

        #endregion

    
        #region Propiedades de navegación
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("FactoryPCModel", "FK_Venta_rutUsuario", "Venta")]
        public EntityCollection<Venta> Venta
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedCollection<Venta>("FactoryPCModel.FK_Venta_rutUsuario", "Venta");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedCollection<Venta>("FactoryPCModel.FK_Venta_rutUsuario", "Venta", value);
                }
            }
        }

        #endregion

    }
    
    /// <summary>
    /// No hay documentación de metadatos disponible.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="FactoryPCModel", Name="Venta")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class Venta : EntityObject
    {
        #region Método de generador
    
        /// <summary>
        /// Crear un nuevo objeto Venta.
        /// </summary>
        /// <param name="codVenta">Valor inicial de la propiedad codVenta.</param>
        /// <param name="total">Valor inicial de la propiedad total.</param>
        /// <param name="fechaVenta">Valor inicial de la propiedad fechaVenta.</param>
        /// <param name="codCarrito">Valor inicial de la propiedad codCarrito.</param>
        /// <param name="rutUsuario">Valor inicial de la propiedad rutUsuario.</param>
        public static Venta CreateVenta(global::System.Int32 codVenta, global::System.Int64 total, global::System.DateTime fechaVenta, global::System.Int32 codCarrito, global::System.String rutUsuario)
        {
            Venta venta = new Venta();
            venta.codVenta = codVenta;
            venta.total = total;
            venta.fechaVenta = fechaVenta;
            venta.codCarrito = codCarrito;
            venta.rutUsuario = rutUsuario;
            return venta;
        }

        #endregion

        #region Propiedades primitivas
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 codVenta
        {
            get
            {
                return _codVenta;
            }
            set
            {
                if (_codVenta != value)
                {
                    OncodVentaChanging(value);
                    ReportPropertyChanging("codVenta");
                    _codVenta = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("codVenta");
                    OncodVentaChanged();
                }
            }
        }
        private global::System.Int32 _codVenta;
        partial void OncodVentaChanging(global::System.Int32 value);
        partial void OncodVentaChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int64 total
        {
            get
            {
                return _total;
            }
            set
            {
                OntotalChanging(value);
                ReportPropertyChanging("total");
                _total = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("total");
                OntotalChanged();
            }
        }
        private global::System.Int64 _total;
        partial void OntotalChanging(global::System.Int64 value);
        partial void OntotalChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.DateTime fechaVenta
        {
            get
            {
                return _fechaVenta;
            }
            set
            {
                OnfechaVentaChanging(value);
                ReportPropertyChanging("fechaVenta");
                _fechaVenta = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("fechaVenta");
                OnfechaVentaChanged();
            }
        }
        private global::System.DateTime _fechaVenta;
        partial void OnfechaVentaChanging(global::System.DateTime value);
        partial void OnfechaVentaChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 codCarrito
        {
            get
            {
                return _codCarrito;
            }
            set
            {
                OncodCarritoChanging(value);
                ReportPropertyChanging("codCarrito");
                _codCarrito = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("codCarrito");
                OncodCarritoChanged();
            }
        }
        private global::System.Int32 _codCarrito;
        partial void OncodCarritoChanging(global::System.Int32 value);
        partial void OncodCarritoChanged();
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String rutUsuario
        {
            get
            {
                return _rutUsuario;
            }
            set
            {
                OnrutUsuarioChanging(value);
                ReportPropertyChanging("rutUsuario");
                _rutUsuario = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("rutUsuario");
                OnrutUsuarioChanged();
            }
        }
        private global::System.String _rutUsuario;
        partial void OnrutUsuarioChanging(global::System.String value);
        partial void OnrutUsuarioChanged();

        #endregion

    
        #region Propiedades de navegación
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("FactoryPCModel", "FK_Venta_codCarrito", "Carrito")]
        public Carrito Carrito
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Carrito>("FactoryPCModel.FK_Venta_codCarrito", "Carrito").Value;
            }
            set
            {
                ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Carrito>("FactoryPCModel.FK_Venta_codCarrito", "Carrito").Value = value;
            }
        }
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [BrowsableAttribute(false)]
        [DataMemberAttribute()]
        public EntityReference<Carrito> CarritoReference
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Carrito>("FactoryPCModel.FK_Venta_codCarrito", "Carrito");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedReference<Carrito>("FactoryPCModel.FK_Venta_codCarrito", "Carrito", value);
                }
            }
        }
    
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("FactoryPCModel", "FK_Venta_rutUsuario", "Usuario")]
        public Usuario Usuario
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Usuario>("FactoryPCModel.FK_Venta_rutUsuario", "Usuario").Value;
            }
            set
            {
                ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Usuario>("FactoryPCModel.FK_Venta_rutUsuario", "Usuario").Value = value;
            }
        }
        /// <summary>
        /// No hay documentación de metadatos disponible.
        /// </summary>
        [BrowsableAttribute(false)]
        [DataMemberAttribute()]
        public EntityReference<Usuario> UsuarioReference
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Usuario>("FactoryPCModel.FK_Venta_rutUsuario", "Usuario");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedReference<Usuario>("FactoryPCModel.FK_Venta_rutUsuario", "Usuario", value);
                }
            }
        }

        #endregion

    }

    #endregion

    
}
