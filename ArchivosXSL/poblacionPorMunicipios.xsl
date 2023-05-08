<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="1600" height="900">


            <!-- Pone el fondo de cuaderno -->
            <defs>
                <pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse" opacity="0.3">
                    <rect width="20" height="20" fill="#fff"></rect>
                    <path d="M 0 0 L 20 0" fill="none" stroke="#ddd" stroke-width="1"/>
                </pattern>
            </defs>

            <!-- Coloca la barra vertical -->
            <rect width="100%" height="100%" fill="url(#grid)"/>
            <svg width="1000" height="1000">
                <line x1="200" y1="0" x2="200" y2="900" stroke="black" stroke-width="2"/>
            </svg>


            <xsl:variable name="BaranainTotales" select="data/row[Nacionalidad='Total'][Municipios='Barañain']/Total/text()"/>
            <xsl:variable name="PamplonaTotales" select="data/row[Nacionalidad='Total'][Municipios='Pamplona/Iruña']/Total/text()"/>
            <xsl:variable name="TudelaTotales" select="data/row[Nacionalidad='Total'][Municipios='Tudela']/Total/text()"/>
            <xsl:variable name="Navarros" select="$BaranainTotales+$PamplonaTotales+$TudelaTotales"/>

            <!-- Inicializamos las variables -->
            <xsl:for-each select="data/row">
                <xsl:variable name="Municipios" select="Municipios"/>
                <xsl:variable name="Nacionalidad" select="Nacionalidad"/>
                <xsl:variable name="Sexo" select="Sexo"/>
                <xsl:variable name="Total" select="Total"/>



                <!-- Determinar la posicion en funcion del Municipio -->
                <xsl:variable name="posicion">
                    <xsl:choose>
                        <xsl:when test="$Municipios = 'Barañain'">300</xsl:when>
                        <xsl:when test="$Municipios = 'Pamplona/Iruña'">700</xsl:when>
                        <xsl:when test="$Municipios = 'Tudela'">1150</xsl:when>
                        <xsl:otherwise>1000</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-- Determinar la posición en función de la nacionalidad -->
                <xsl:variable name="posicionNacionalidad">
                    <xsl:choose>

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
                        <xsl:otherwise>100000</xsl:otherwise>
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

                <!-- Crea el patron de rallas diagonales -->
                <defs>
                    <pattern id="diagonal-stripe" patternUnits="userSpaceOnUse" width="10" height="10">
                        <path d="M-1,1 l2,-2 M0,10 l10,-10 M9,11 l2,-2" stroke="{$colorBorde}" stroke-width="2"
                              opacity="0.5"/>
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


                <!-- Coloca los Numeros totales arriba -->
                <xsl:if test="$Sexo='Ambos sexos'">
                    <text x="{number($posicion)+number($posicionNacionalidad)+20}" y="{900-number($Total div 10)-10}"
                          font-size="14" fill="black" text-anchor="middle">
                        <xsl:value-of select="$Total"/>
                    </text>
                </xsl:if>


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



            </xsl:for-each>

            <!-- Crea los degradados -->
            <defs>
                <linearGradient id="blue">
                    <stop offset="0%" stop-color="#0088ff"/>
                    <stop offset="100%" stop-color="#0055aa"/>
                </linearGradient>
                <linearGradient id="grey">
                    <stop offset="0%" stop-color="#999999"/>
                    <stop offset="100%" stop-color="#666666"/>
                </linearGradient>
                <linearGradient id="brown">
                    <stop offset="0%" stop-color="#a55f3e"/>
                    <stop offset="100%" stop-color="#723d23"/>
                </linearGradient>
                <linearGradient id="orange">
                    <stop offset="0%" stop-color="#ff8800"/>
                    <stop offset="100%" stop-color="#aa5500"/>
                </linearGradient>
                <linearGradient id="green">
                    <stop offset="0%" stop-color="#5eba5e"/>
                    <stop offset="100%" stop-color="#3c763d"/>
                </linearGradient>
                <linearGradient id="yellow">
                    <stop offset="0%" stop-color="#ffff00"/>
                    <stop offset="100%" stop-color="#b2b200"/>
                </linearGradient>
                <linearGradient id="red">
                    <stop offset="0%" stop-color="#ff0000"/>
                    <stop offset="100%" stop-color="#990000"/>
                </linearGradient>
                <linearGradient id="purple">
                    <stop offset="0%" stop-color="#6a0dad"/>
                    <stop offset="100%" stop-color="#380147"/>
                </linearGradient>
                <linearGradient id="pink">
                    <stop offset="0%" stop-color="#ff99cc"/>
                    <stop offset="100%" stop-color="#cc3366"/>
                </linearGradient>
            </defs>


            <!-- Leyenda -->
            <rect x="210" y="10" width="20" height="20" fill="url(#blue)"/>
            <text x="240" y="25" font-size="14">Extranjeros de la UE</text>
            <rect x="210" y="40" width="20" height="20" fill="url(#grey)"/>
            <text x="240" y="55" font-size="14">Extranjeros fuera de la UE</text>
            <rect x="210" y="70" width="20" height="20" fill="url(#brown)"/>
            <text x="240" y="85" font-size="14">Africanos</text>
            <rect x="210" y="100" width="20" height="20" fill="url(#orange)"/>
            <text x="240" y="115" font-size="14">Norteamericanos</text>
            <rect x="210" y="130" width="20" height="20" fill="url(#green)"/>
            <text x="240" y="145" font-size="14">Sudamericanos</text>
            <rect x="210" y="160" width="20" height="20" fill="url(#yellow)"/>
            <text x="240" y="175" font-size="14">Chinos</text>
            <rect x="210" y="190" width="20" height="20" fill="url(#pink)"/>
            <text x="240" y="205" font-size="14">Oceania</text>

            <rect x="210" y="250" width="30" height="30" fill="url(#red)"/>
            <text x="250" y="270" font-size="18">NAVARROS TOTALES:  <xsl:value-of select="$Navarros"/></text>

            <rect x="210" y="300" width="30" height="30" fill="url(#purple)"/>
            <text x="250" y="320" font-size="18">BERINIANENSES: <xsl:value-of select="$BaranainTotales"/></text>
            <rect x="210" y="340" width="30" height="30" fill="url(#purple)"/>
            <text x="250" y="360" font-size="18">PAMPLONESES: <xsl:value-of select="$PamplonaTotales"/></text>
            <rect x="210" y="380" width="30" height="30" fill="url(#purple)"/>
            <text x="250" y="400" font-size="18">TUDELANOS: <xsl:value-of select="$TudelaTotales"/></text>

            <!-- Numeros de la izquierda -->
            <xsl:for-each select="data/row">
                <text x="100" y="{900-position()*20}" font-size="20" font-weight="bold">
                    <xsl:value-of select="200 * position()"/>
                </text>

            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>
