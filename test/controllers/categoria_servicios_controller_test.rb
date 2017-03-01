require 'test_helper'

class CategoriaServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoria_servicio = categoria_servicios(:one)
  end

  test "should get index" do
    get categoria_servicios_url
    assert_response :success
  end

  test "should get new" do
    get new_categoria_servicio_url
    assert_response :success
  end

  test "should create categoria_servicio" do
    assert_difference('CategoriaServicio.count') do
      post categoria_servicios_url, params: { categoria_servicio: { codigo: @categoria_servicio.codigo, estatus: @categoria_servicio.estatus, nombre: @categoria_servicio.nombre } }
    end

    assert_redirected_to categoria_servicio_url(CategoriaServicio.last)
  end

  test "should show categoria_servicio" do
    get categoria_servicio_url(@categoria_servicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoria_servicio_url(@categoria_servicio)
    assert_response :success
  end

  test "should update categoria_servicio" do
    patch categoria_servicio_url(@categoria_servicio), params: { categoria_servicio: { codigo: @categoria_servicio.codigo, estatus: @categoria_servicio.estatus, nombre: @categoria_servicio.nombre } }
    assert_redirected_to categoria_servicio_url(@categoria_servicio)
  end

  test "should destroy categoria_servicio" do
    assert_difference('CategoriaServicio.count', -1) do
      delete categoria_servicio_url(@categoria_servicio)
    end

    assert_redirected_to categoria_servicios_url
  end
end
