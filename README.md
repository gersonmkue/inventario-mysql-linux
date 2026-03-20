# Inventario MySQL en Linux

Sistema de control de inventario basado en MySQL con automatización en Linux.

## Funcionalidades

- Registro de productos y categorías
- Control de movimientos (entrada/salida)
- Cálculo de stock en tiempo real
- Consulta tipo dashboard
- Generación de reportes automatizados

## Estructura

- `sql/` → esquema y consultas
- `scripts/` → automatización en bash
- `reportes/` → salida de reportes

## Ejecutar reporte

```bash
./scripts/reporte_inventario.sh
