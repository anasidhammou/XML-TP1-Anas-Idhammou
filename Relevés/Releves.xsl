<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Relevé Bancaire</title>
                <style>
                    body {
                    font-family: Arial;
                    margin: 30px;
                    }
                    
                    h2 {
                    text-align: center;
                    color: #2c3e50;
                    }
                    
                    table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                    }
                    
                    th, td {
                    border: 1px solid black;
                    padding: 10px;
                    text-align: center;
                    }
                    
                    th {
                    background-color: #ddd;
                    }
                    
                    .total {
                    font-weight: bold;
                    margin-top: 20px;
                    }
                </style>
            </head>
            
            <body>
                
                <h2>RELEVÉ BANCAIRE</h2>
                
                <h3>Informations du compte</h3>
                
                <p>
                    <b>RIB :</b>
                    <xsl:value-of select="Releves/@RIB"/>
                </p>
                
                <p>
                    <b>Date du relevé :</b>
                    <xsl:value-of select="Releves/dateReleve"/>
                </p>
                
                <p>
                    <b>Solde :</b>
                    <xsl:value-of select="Releves/solde"/>
                </p>
                
                <h3>Période des opérations</h3>
                
                <p>
                    Du :
                    <xsl:value-of select="Releves/Operations/@dateDebut"/>
                    
                    Au :
                    <xsl:value-of select="Releves/Operations/@dateFin"/>
                </p>
                
                <h3>Liste des opérations</h3>
                
                <table>
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    
                    <xsl:for-each select="Releves/Operations/operation">
                        
                        <tr>
                            <td>
                                <xsl:value-of select="@type"/>
                            </td>
                            
                            <td>
                                <xsl:value-of select="@date"/>
                            </td>
                            
                            <td>
                                <xsl:value-of select="@montant"/>
                            </td>
                            
                            <td>
                                <xsl:value-of select="@description"/>
                            </td>
                        </tr>
                        
                    </xsl:for-each>
                    
                </table>
                
                <h3>Récapitulatif des opérations</h3>
                
                <p class="total">
                    Total des DÉBITS :
                    <xsl:value-of select="sum(Releves/Operations/operation[@type='DEBIT']/@montant)"/>
                </p>
                
                <p class="total">
                    Total des CRÉDITS :
                    <xsl:value-of select="sum(Releves/Operations/operation[@type='CREDIT']/@montant)"/>
                </p>
                
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>