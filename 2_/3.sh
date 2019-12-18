#!/bin/bash
#Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа #в новую базу данных sample.

mysqldump example > example.sql
mysqladmin create sample
mysql sample < example.sql

exit 0
