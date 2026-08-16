package com.servlet.files;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Utility class to compute expense aggregates.
 * Uses DatabaseConnection.getConnection() from your project.
 *
 * Assumptions:
 *  - The expenses are stored in table `addexpenses` (as in your ProcessExpensesServlet).
 *  - Columns used: user_id (VARCHAR), category (VARCHAR), amount (DECIMAL), expense_date (DATE or DATETIME)
 *
 * If your columns are named differently change the SQL column names accordingly.
 */
public class ExpenseCalculator {

    /**
     * Returns per-category total for the given username.
     * Map maintains insertion order (LinkedHashMap) to keep stable category ordering.
     * @param user_id
     * @return 
     */
    public Map<String, Double> getCategoryTotals(int user_id) {
    Map<String, Double> map = new LinkedHashMap<>();
    String sql = "SELECT category, SUM(amount) AS total " +
                 "FROM expenses " +
                 "WHERE user_id = ? " +
                 "GROUP BY category " +
                 "ORDER BY total DESC";

    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, user_id);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String category = rs.getString("category");
                double total = rs.getDouble("total");
                map.put(category == null ? "Uncategorized" : category, total);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace(); // <- important to see errors
    }
    return map;
    }

    /**
     * Returns total spent by username.
     * @param user_id
     * @return 
     */
    public double getTotalSpent(int user_id) {
        String sql = "SELECT SUM(amount) AS total FROM expenses WHERE user_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, user_id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    /**
     * Returns a LinkedHashMap of the last N months (YYYY-MM) => total spent in that month.
     * monthsCount: number of months back (e.g. 6). Returned map is ordered from oldest -> newest.
     * @param user_id
     * @param monthsCount
     * @return 
     */
    public Map<String, Double> getMonthlyTotals(int user_id, int monthsCount) {
        LinkedHashMap<String, Double> monthly = new LinkedHashMap<>();
        // Use MySQL DATE_FORMAT to group by year-month
        String sql =
            "SELECT DATE_FORMAT(expense_date, '%Y-%m') AS ym, SUM(amount) AS total " +
            "FROM expenses " +
            "WHERE user_id = ? " +
            "GROUP BY ym " +
            "ORDER BY ym DESC " +
            "LIMIT ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, user_id);
            ps.setInt(2, monthsCount);
            try (ResultSet rs = ps.executeQuery()) {
                // result is newest -> oldest due to ORDER BY ... DESC
                java.util.List<java.util.Map.Entry<String, Double>> tmp = new java.util.ArrayList<>();
                while (rs.next()) {
                    tmp.add(new java.util.AbstractMap.SimpleEntry<>(
                        rs.getString("ym"),
                        rs.getDouble("total")
                    ));
                }
                // reverse to oldest -> newest for nicer charts
                for (int i = tmp.size() - 1; i >= 0; i--) {
                    java.util.Map.Entry<String, Double> e = tmp.get(i);
                    monthly.put(e.getKey(), e.getValue());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return monthly;
    }
        public Map<String, Double> getCategoryTotalsForMonth(int user_id, String month) {
        Map<String, Double> map = new LinkedHashMap<>();
        String sql = "SELECT purpose AS category, SUM(amount) AS total " +
                     "FROM expenses " +
                     "WHERE user_id = ? AND DATE_FORMAT(expense_date, '%Y-%m') = ? " +
                     "GROUP BY purpose " +
                     "ORDER BY total DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, user_id);
            ps.setString(2, month);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String category = rs.getString("category");
                    double total = rs.getDouble("total");
                    map.put(category == null ? "Uncategorized" : category, total);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return map;
    }
}