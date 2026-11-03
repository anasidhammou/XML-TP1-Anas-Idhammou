<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Météo</title>
            </head>
            <body>
                <h1>Résultats météo</h1>
                <xsl:for-each select="meteo/mesure">
                    <h2>
                        Date : <xsl:value-of select="@date"/>
                    </h2>
                    <table border="1" width="100%">
                        <tr>
                            <th>Nom</th>
                            <th>Température</th>
                        </tr>
                        <xsl:for-each select="ville">
                            <tr>
                                <td>
                                    <xsl:value-of select="@nom"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@temperature"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <br/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>