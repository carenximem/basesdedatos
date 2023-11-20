CREATE DEFINER=`root`@`localhost` PROCEDURE `AerolineaMenu`()
BEGIN
    DECLARE user_input VARCHAR(255);
    DECLARE choice INT;

    AerolineaMenuLoop: LOOP

        SELECT '1. Visualizar información de reservas' AS MenuOption;
        SELECT '2. Modificar una reserva' AS MenuOption;
        SELECT '3. Consultar el porcentaje de ocupación del avión' AS MenuOption;
        SELECT '4. Consultar el valor total de ventas por concepto de sillas ocupadas en el avión' AS MenuOption;
        SELECT '5. Consultar el valor promedio de venta por concepto de sillas ocupadas / pasajero en el avión' AS MenuOption;
        SELECT '0. Salir' AS MenuOption;


        SET user_input = NULL;
        WHILE user_input IS NULL DO
            SELECT 'Ingrese el número de la opción deseada:' INTO user_input;
            SELECT user_input;
        END WHILE;


        SET choice = CAST(user_input AS UNSIGNED);


        CASE choice
            WHEN 1 THEN
                SELECT * FROM reservas;
            WHEN 2 THEN
                --  modificar una reserva
                UPDATE reservas SET silla_id = 3 WHERE id = 1;
            WHEN 3 THEN
                -- calcular el porcentaje de ocupación del avión
                SELECT COUNT(*) / 50 * 100 AS PorcentajeOcupacion FROM reservas;
            WHEN 4 THEN
                --  calcular el valor total de ventas por concepto de sillas ocupadas en el avión
                SELECT SUM(valor) AS ValorTotalVentas FROM ventas;
            WHEN 5 THEN
                --  calcular el valor promedio de venta por concepto de sillas ocupadas / pasajero en el avión
                SELECT AVG(valor) AS ValorPromedioVenta FROM ventas;
            WHEN 0 THEN
                LEAVE AerolineaMenuLoop;
            ELSE
                SELECT 'Opción no válida. Inténtelo de nuevo.';
        END CASE;
    END LOOP AerolineaMenuLoop;
END;
