# Test-exam-application
Add this code for yout standalone.xml file inside of tag <datasouces></datasources> if you will user wildfly server.
<datasource jndi-name="java:/jdbc/SchoolERPDS" pool-name="SchoolERPDS" enabled="true" use-java-context="true">
    <connection-url>jdbc:mysql://localhost:3306/SchoolERP</connection-url>
    <driver>mysql</driver>
    <security>
        <user-name>root</user-name>
    </security>
</datasource>
