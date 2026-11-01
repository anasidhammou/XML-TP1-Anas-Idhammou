<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="/">
    <html>
        <head>
            <title>
                TP BIBLIO ANAS IDHAMMOU
            </title>
        </head>
        <body>
            <h1> Bienvenue dans Bibliotheque Anas Idhammou</h1>
            <xsl:for-each select="biblio/etudiant">
                <ul>
                    <li>Code : <xsl:value-of select="@Code"/> </li>
                    <li>Nom : <xsl:value-of select="@Nom"/> </li>
                    <li>Prenom : <xsl:value-of select="@Prenom"/> </li>
                </ul>
                
                <table border="1" width="100%">
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Date Emprunt</th>
                        <th>Rendu</th>
                    </tr>
            
                    <xsl:for-each select="livre">
                        <tr>
                            <td><xsl:value-of select = "@Id"/></td>
                            <td><xsl:value-of select = "@Titre"/></td>
                            <td><xsl:value-of select = "@Date_Emprunt"/></td>
                            <td><xsl:value-of select = "@rendu"/></td>
                        </tr>
                        
                    </xsl:for-each>
                    
                    <tr>
                        <td colspan="3">Nombre de livre emprunt </td>
                        <td colspan="3"><xsl:value-of select="count(livre)"/></td>
                    </tr>
                    
                    <tr>
                        <td colspan="3">Nombre de livre emprunt OUI</td>
                        <td colspan="3"><xsl:value-of select="count(livre[@rendu='oui'])"/></td>
                    </tr>
                    
                    <tr>
                        <td colspan="3">Nombre de livre emprunt NON</td>
                        <td colspan="3"><xsl:value-of select="count(livre[@rendu='non'])"/></td>
                    </tr>
                </table>
            </xsl:for-each>
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>