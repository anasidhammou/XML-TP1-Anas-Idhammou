<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Hello Moto</title>
            </head>
            <body>
                <table border="1" width="100%">
                    <tr>
                        <th>Num</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Expediteur</th>
                        <th>Destinataire</th>
                        <th>Etat</th>
                    </tr>
                    <xsl:for-each select="rapport/mandat">
                        <tr>
                            <td> <xsl:value-of select="@num"/> </td>
                            <td> <xsl:value-of select="@date"/> </td>
                            <td> <xsl:value-of select="@montant"/> </td>
                            <td> 
                                <ul>
                                    <li>Cin:<xsl:value-of select="expediteur/@cin"/></li>
                                    <li>Cin:<xsl:value-of select="expediteur/@prenom"/></li>  
                                </ul> 
                            </td>
                            <td> 
                                <ul>
                                    <li>Cin:<xsl:value-of select="Destinataire/@cin"/></li>
                                    <li>Cin:<xsl:value-of select="Destinataire/@prenom"/></li>  
                                </ul> 
                            </td>
                            <td><xsl:value-of select="@etat"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="5">Total Montant</td>
                        <td><xsl:value-of select="sum(rapport/mandat/@montant)"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>