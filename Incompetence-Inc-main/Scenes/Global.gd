extends Node
#O que pode passar na prancheta
var declared_values = [1, 5, 10, 20, 50, 100, 200, 500, 1000, 1500]
#@onready var moneycash = $Money
#Dinheiro
var dinheiro = 0
var data_dinheiro = [3000,5000,7500,8200,8000,8255]
var data_gasto = [-2500,-4500,-6000,-6800,-7300,-7000]
var valor:int
#Dia
var dia = 1
var dia_i = 0
#Animação de Transição em Shaders
var playing = false
