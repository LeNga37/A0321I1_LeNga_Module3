package repository.service.impl;

import bean.Service;
import repository.DBConnection;
import repository.service.ServiceRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository {
    private static final String SELECT_ALL_SERVICE = "SELECT * FROM furama_resort_1.service";
    private static final String INSERT_SERVICE ="INSERT INTO `furama_resort_1`.`service` (`service_name`, `service_area`, " +
            "`service_cost`, `service_max_people`, `rent_type_id`, `service_type_id`, `standard_room`, `description_other_convenience`, " +
            "`pool_area`, `number_of_floors`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    @Override
    public List<Service> findAll() {
        List<Service> serviceList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int serviceId = resultSet.getInt("service_id");
                    String serviceName = resultSet.getString("service_name");
                    int serviceArea = resultSet.getInt("service_area");
                    double serviceCost = resultSet.getDouble("service_cost");
                    int serviceMaxPeople = resultSet.getInt("service_max_people");
                    int rentTypeId = resultSet.getInt("rent_type_id");
                    int serviceTypeId = resultSet.getInt("service_type_id");
                    String standardRoom = resultSet.getString("standard_room");
                    String descriptionConvenience = resultSet.getString("description_other_convenience");
                    double poolArea = resultSet.getDouble("pool_area");
                    int numberFloor = resultSet.getInt("number_of_floors");
                    serviceList.add(new Service(serviceId, serviceName, serviceArea, serviceCost, serviceMaxPeople,
                            rentTypeId, serviceTypeId, standardRoom, descriptionConvenience,poolArea,numberFloor));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return serviceList;
    }

    @Override
    public void creatNewService(Service service) {
        Connection connection = DBConnection.getConnection();
        System.out.println(1);
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE);
                preparedStatement.setString(1, service.getServiceName());
                preparedStatement.setInt(2, service.getServiceArea());
                preparedStatement.setDouble(3, service.getServiceCost());
                preparedStatement.setInt(4, service.getServiceMaxPeople());
                System.out.println(service.getServiceMaxPeople());
                preparedStatement.setInt(5, service.getRentTypeId());
                preparedStatement.setInt(6, service.getServiceTypeId());
                System.out.println(service.getRentTypeId());
                System.out.println(service.getServiceTypeId());
                preparedStatement.setString(7, service.getStandardRoom());
                preparedStatement.setString(8, service.getDescriptionConvenience());
                preparedStatement.setDouble(9, service.getPoolArea());
                preparedStatement.setInt(10, service.getNumberFloor());
                preparedStatement.executeUpdate();
                System.out.println(2);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }
}
