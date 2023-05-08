<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="1600" height="900">

            <!-- Inicializamos las variables -->
            <xsl:for-each select="data/row">
                <xsl:variable name="Municipios" select="Municipios"/>
                <xsl:variable name="Nacionalidad" select="Nacionalidad"/>
                <xsl:variable name="Sexo" select="Sexo"/>
                <xsl:variable name="Total" select="Total"/>

                <!-- Determinar la posicion en funcion del Municipio -->
                <xsl:variable name="posicion">
                    <xsl:choose>
                        <xsl:when test="$Municipios = 'Barañain'">0</xsl:when>
                        <xsl:when test="$Municipios = 'Pamplona/Iruña'">600</xsl:when>
                        <xsl:when test="$Municipios = 'Tudela'">1200</xsl:when>
                        <xsl:otherwise>1000</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-- Determinar la posición en función de la nacionalidad -->
                <xsl:variable name="posicionNacionalidad">
                    <xsl:choose>
                        <xsl:when test="$Nacionalidad = 'Total'">0</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Española'">50</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país miembro de la UE'">100</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país europeo no miembro de la UE'">150
                        </xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de África'">200</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de América del Norte'">250</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de América del Sur, Central o Caribe'">
                            300
                        </xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de Asia'">350</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de Oceanía y apátridas'">400</xsl:when>
                        <xsl:otherwise>1</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-- Determinar el color en función de la nacionalidad -->
                <xsl:variable name="color">
                    <xsl:choose>
                        <xsl:when test="$Nacionalidad = 'Total'">azul</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Española'">red</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país miembro de la UE'">blue</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país europeo no miembro de la UE'">grey
                        </xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de África'">brown</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de América del Norte'">orange</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de América del Sur, Central o Caribe'">
                            green
                        </xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de Asia'">yellow</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de Oceanía y apátridas'">lightblue
                        </xsl:when>
                        <xsl:otherwise>90</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-- Determinar el color del borde en función del genero -->
                <xsl:variable name="colorBorde">
                    <xsl:choose>
                        <xsl:when test="$Sexo = 'Ambos sexos'">#FFFFFF</xsl:when>
                        <xsl:when test="$Sexo = 'Mujeres'">#ff0080</xsl:when>
                        <xsl:when test="$Sexo = 'Hombres'">#0000FF</xsl:when>
                        <xsl:otherwise>90</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-- Crea el patron -->
                <defs>
                    <pattern id="diagonal-stripe" patternUnits="userSpaceOnUse" width="10" height="10">
                        <path d="M-1,1 l2,-2 M0,10 l10,-10 M9,11 l2,-2" stroke="{$colorBorde}" stroke-width="2" opacity="0.5"/>
                    </pattern>
                </defs>

                <!-- Crea las columnas -->
                <rect x="{number($posicion)+number($posicionNacionalidad)}" y="{900-number($Total div 10)}"
                      width="40" height="{$Total}"
                      fill="{$color}" stroke="{$colorBorde}" stroke-width="2" opacity="0.6"
                      rx="20" ry="20"/>

                <rect x="{number($posicion)+number($posicionNacionalidad)}" y="{900-number($Total div 10)}"
                      width="40" height="{$Total}"
                      fill="url(#diagonal-stripe)" stroke="{$colorBorde}" stroke-width="2" opacity="0.6"
                      rx="20" ry="20"/>


                <!-- Determina el valor del text -->
                <xsl:variable name="texto">
                    <xsl:choose>
                        <xsl:when test="$Nacionalidad = 'Total'">Total</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Española'">Español</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país miembro de la UE'">UE</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país europeo no miembro de la UE'">no UE
                        </xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de África'">Africano</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de América del Norte'">Norteamericano
                        </xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de América del Sur, Central o Caribe'">
                            Sudamericano
                        </xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de Asia'">Chino</xsl:when>
                        <xsl:when test="$Nacionalidad = 'Extranjera, de un país de Oceanía y apátridas'">Austriaco
                        </xsl:when>
                        <xsl:otherwise>90</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-- Coloca los textos -->
                <xsl:if test="$Sexo='Ambos sexos'">
                    <text x="{number($posicion)+number($posicionNacionalidad)}" y="{900}" text-anchor="middle"
                          font-size="10" fill="black">
                        <xsl:value-of select="$texto"/>
                    </text>
                </xsl:if>

            </xsl:for-each>


        </svg>
    </xsl:template>
</xsl:stylesheet>
