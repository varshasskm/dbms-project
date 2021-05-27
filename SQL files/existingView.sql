CREATE OR REPLACE VIEW PRESENTVIEW AS SELECT BOOKING.BOOKING_ID AS BOOKING_ID, BOOKING.EXPRESS_NO AS EXPRESS_NO,BOOKING.USER_ID AS USER_ID, BOOKING.TRAIN_NO AS TRAIN_NO,
DATE(EXPRESS.STARTING_TIME) AS DEPARTURE_DATE, TIME(EXPRESS.STARTING_TIME) AS DEPARTURE_TIME, BOOKING.TOTAL_FC_SEATS AS TOTAL_FC_SEATS,
BOOKING.TOTAL_SC_SEATS AS TOTAL_SC_SEATS, BOOKING.TOTAL_COST AS TOTAL_COST FROM BOOKING INNER JOIN EXPRESS ON (BOOKING.EXPRESS_NO=EXPRESS.EXPRESS_NO);