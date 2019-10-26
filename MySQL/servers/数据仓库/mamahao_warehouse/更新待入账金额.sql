select member_id,\n" +
            " sum(commission_amount) as wait_in_account\n " +
            " from t_star_member_sales \n" +
            " where member_id in (" +
            "            <foreach collection='memberIds' item='memberId'  index='index'  separator=','>" +
            "                #{memberId}" +
            "            </foreach>) " +
            "  and  sale_status in (2,3) " +
            " group by member_id" +
       