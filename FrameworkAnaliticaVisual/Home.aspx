<%@ Page Title="" Language="C#" MasterPageFile="~/StandardForm.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FrameworkAnaliticaVisual.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always" OnLoad="btnAgregarEnlace_Click">
        <ContentTemplate>
            <asp:Wizard ID="Wizard1" runat="server">
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Conexión a la base de datos">

                        <asp:Label ID="lblTipo" runat="server" Text="Tipo: "></asp:Label><br />
                        <asp:DropDownList ID="ddlTipoDB" runat="server" AutoPostBack="True">
                            <asp:ListItem>MySQL</asp:ListItem>
                            <asp:ListItem>SQL Server</asp:ListItem>
                            <asp:ListItem>Oracle</asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:Label ID="lblServidor" runat="server" Text="Servidor: "></asp:Label><br />
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario: "></asp:Label><br />
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
                        <asp:Label ID="lblContrasena" runat="server" Text="Contraseña: "></asp:Label><br />
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />

                    </asp:WizardStep>

                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Selección de tablas">
                        <div class="steps">
                            <asp:DropDownList ID="ddlTablas" runat="server" OnSelectedIndexChanged="ddlTablas_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList><br />
                            <asp:DropDownList ID="ddlColumnas" runat="server">
                            </asp:DropDownList><br />
                            <asp:Button ID="btnAgregarColumnas" runat="server" Text="Agregar Columnas" OnClick="btnAgregarColumnas_Click" />
                        </div>
                    </asp:WizardStep>

                    <asp:WizardStep ID="WizardStep3" runat="server" Title="Asociación de las columnas">
                        <asp:Label ID="lblCamposTabla" runat="server" Text="Campos de la Tabla: "></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddlEnlaceTabla" runat="server"></asp:DropDownList>
                        <br />
                        <asp:Label ID="lblCamposCanvas" runat="server" Text="Campos del Canvas: "></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddlEnlaceCanvas" runat="server"></asp:DropDownList>
                        <br />
                        <asp:Button ID="btnAgregarEnlace" runat="server" Text="Agregar Elance" Enabled="false" />
                        <asp:GridView ID="gvDatos" runat="server" Enabled="true" OnRowDeleting="gvDatos_RowDeleting" OnRowCreated="gvDatos_RowCreated">
                            <Columns>
                                <asp:CommandField ButtonType="Link" ShowDeleteButton="True" />
                                <asp:TemplateField HeaderText="Datos_Canvas">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlCamposCanvas" runat="server">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="btnGenrarCodigo" runat="server" Text="Generar Codigo" OnClick="btnGenrarCodigo_Click" />
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
