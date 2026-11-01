<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="/">
        <html>
            <head>
             Bonjour dans mon agence téléphonique   
            </head>
            <body>
                <h1> Bienvenue dans mon agence </h1>
                <h2>La liste des clients</h2>
                <xsl:for-each select="Operateur/client">
                    <ul>
                        <li>Code : <xsl:value-of select="@code"/> </li>
                        <li>Nom : <xsl:value-of select="@Nom"/> </li>
                    </ul>
                    <h3>Abonnement du client <xsl:value-of select="@Nom"/></h3>
                        <table border="1" width="100%">
                            <thead>
                                <tr>
                                    <td>num</td>
                                    <td>type</td>
                                    <td>dateAb</td>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="abonnement">
                                    <tr>
                                        <td><xsl:value-of select="@num"/></td>
                                        <td><xsl:value-of select="@dateAb"/></td>
                                        <td><xsl:value-of select="@type"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    <h3>facture du client : <xsl:value-of select="@Nom"/></h3>
                    <table border="1" width="100%">
                        <thead>
                            <tr>
                                <td>NumFacture</td>
                                <td>DateFacture</td>
                                <td>Montant</td>
                                <td>Regler</td>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="abonnement/facture">
                                <tr>
                                    <td><xsl:value-of select="@NumFacture"/></td>
                                    <td><xsl:value-of select="@DateFacture"/></td>
                                    <td><xsl:value-of select="@Montant"/></td>
                                    <td><xsl:value-of select="@Regler"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>