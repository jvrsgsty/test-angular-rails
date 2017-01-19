class HomeController < ApplicationController
  def index
  end
  
  def marcas_modelos
    autos = '{"marcas" : [
      {"marca" : {"nombre": "Audi", "modelos": [
          {"modelo": {"nombre" : "A1"}},
          {"modelo": {"nombre" : "Q5"}},
          {"modelo": {"nombre" : "R8"}}
        ]}},
      {"marca" : {"nombre": "BMW", "modelos": [
          {"modelo": {"nombre" : "350"}},
          {"modelo": {"nombre" : "i8"}}
        ]}},
      {"marca" : {"nombre": "KIA", "modelos": [
          {"modelo": {"nombre" : "Forte"}},
          {"modelo": {"nombre" : "Rio"}},
          {"modelo": {"nombre" : "Sportage"}}
        ]}},
      {"marca" : {"nombre": "Mazda", "modelos": [
          {"modelo": {"nombre" : "3"}},
          {"modelo": {"nombre" : "6"}},
          {"modelo": {"nombre" : "MX-5"}}
        ]}},
      {"marca" : {"nombre": "Mercedes Benz", "modelos": [
        {"modelo": {"nombre" : "C280"}},
        {"modelo": {"nombre" : "S500"}},
        {"modelo": {"nombre" : "B180"}}
      ]}}
    ]}'
    
    render json: autos
  end
  
  def guarda_precios
    precios = JSON.parse(params[:precios],:symbolize_names => true)
    if precios.class == Array && precios.length > 0
      if !precios[0][:marca].nil? && !precios[0][:modelo].nil? && !precios[0][:precio].nil?
        render json: {exito: "Exito"}, status: 200
      else
        render json: {error: "Los datos no cumplen con el formato especificado"}, status: 404
      end
    else
      render json: {error: "Hubo un error"}, status: 500
    end
  end
end